import 'dart:async';
import 'dart:math';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/analytics/analytics_events_wrapper.dart';
import 'package:todo_list/analytics/event/analytics_event.dart';
import 'package:todo_list/domain/model/todo.dart';
import 'package:todo_list/domain/repository/local_todo_repository.dart';
import 'package:todo_list/domain/repository/network_todo_repository.dart';
import 'package:todo_list/internal/logger.dart';
import 'package:todo_list/util/lifecycle_component.dart';

abstract class ITodoUseCase implements LifeCycleComponent {
  Stream<List<Todo>> get todoListStream;

  List<Todo> get todoList;

  int get countDoneTodos;

  Future<void> getTodoList();

  List<Todo> get allCurrentTodoList;

  Future<void> createTodo(Todo todo);

  Future<void> updateTodo(Todo todo);

  Future<void> deleteTodo(String id);
}

class TodoUseCase implements ITodoUseCase {
  final ILocalTodoRepository _localTodoRepository;
  final INetworkTodoRepository _networkTodoRepository;
  final String revisionKey;
  final IAnalyticsEventsWrapper analyticsEventsWrapper;

  TodoUseCase({
    required ILocalTodoRepository localTodoRepository,
    required INetworkTodoRepository networkTodoRepository,
    required this.revisionKey,
    required this.analyticsEventsWrapper,
  })  : _localTodoRepository = localTodoRepository,
        _networkTodoRepository = networkTodoRepository;

  final BehaviorSubject<List<Todo>> _todoListStreamController =
      BehaviorSubject();

  late final StreamSubscription<List<ConnectivityResult>>?
      _connectivitySubscription;

  List<Todo> _todoList = [];

  @override
  Stream<List<Todo>> get todoListStream => _todoListStreamController.stream;

  @override
  int get countDoneTodos => _todoList.where((todo) => todo.done).length;

  @override
  List<Todo> get todoList => _todoList;

  Future<List<ConnectivityResult>> get connectivityResult =>
      Connectivity().checkConnectivity();

  @override
  void init() {
    /// подписка на стрим, чтобы обновлять текущее состояние сети
    _connectivitySubscription =
        Connectivity().onConnectivityChanged.listen((result) async {
      await getTodoList();
    });
  }

  @override
  void dispose() {
    _connectivitySubscription?.cancel();
    _todoListStreamController.close();
  }

  @override
  Future<void> getTodoList() async {
    if (isInternetConnection(await connectivityResult)) {
      logger.i('RECONNECT');
      try {
        await syncLocalAndNetworkTodos();
        analyticsEventsWrapper.addEvent(AnalyticsEvent(name: 'get_todos'));
      } on Exception catch (e, s) {
        logger.e('Failed sync todos');
        rethrow;
      }
    } else {
      logger.i('NO INTERNET');
      final localTodoList = await _localTodoRepository.getTodoList();
      _todoListStreamController.add(localTodoList);
      _todoList = localTodoList;
    }
  }

  /// синхронизация через сравнения полученных из жвух источников списков
  /// приоритет отдается локальным данным всегда, кроме случая, если задача
  /// с сервера была изменена позднее
  Future<void> syncLocalAndNetworkTodos() async {
    final localRevision = await _getRevision();
    final localTodoList = await _localTodoRepository.getTodoList();
    final networkTodoList = await _networkTodoRepository.getTodoList();
    final networkRevision = await _getRevision();
    await updateRevision(networkRevision, localRevision);
    logger.i('Network revision $networkRevision');
    if (networkRevision != localRevision ||
        !sameTodos(networkTodoList, localTodoList)) {
      if (localTodoList.isNotEmpty) {
        final networkTodosMap = <String, Todo>{
          for (final todo in networkTodoList) todo.id: todo
        };
        for (final todo in localTodoList) {
          if (networkTodosMap.containsKey(todo.id)) {
            final networkTodo = networkTodosMap[todo.id]!;
            if (networkTodo != todo) {
              if (networkTodo.changedAt > todo.changedAt) {
                await _localTodoRepository.saveTodo(networkTodo);
              } else {
                await _networkTodoRepository.updateTodo(todo);
              }
            }
          }
        }

        final updatedTodos = await _networkTodoRepository.updateTodoList(
          await _localTodoRepository.getTodoList(),
        );
        _todoListStreamController.add(updatedTodos);
        _todoList = updatedTodos;
      } else {
        _todoListStreamController.add(networkTodoList);
        _todoList = networkTodoList;
        if (localTodoList.isEmpty) {
          for (final todo in networkTodoList) {
            await _localTodoRepository.saveTodo(todo);
          }
        }
      }
    } else {
      _todoListStreamController.add(networkTodoList);
      _todoList = networkTodoList;
      if (localTodoList.isEmpty) {
        for (final todo in networkTodoList) {
          await _localTodoRepository.saveTodo(todo);
        }
      }
    }
  }

  bool sameTodos(List<Todo> networkTodos, List<Todo> localTodos) {
    return localTodos.every(networkTodos.contains);
  }

  Future<void> updateRevision(int networkRevision, int localRevision) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(revisionKey, max(networkRevision, localRevision));
  }

  @override
  List<Todo> get allCurrentTodoList => _todoListStreamController.value;

  @override
  Future<void> createTodo(Todo todo) async {
    await _localTodoRepository.saveTodo(todo);
    final list = await _localTodoRepository.getTodoList();
    _todoList = list;
    _todoListStreamController.add(_todoList);
    if (isInternetConnection(await connectivityResult)) {
      await _networkTodoRepository.createTodo(todo);
    }
    analyticsEventsWrapper.addEvent(
      AnalyticsEvent(
        name: 'create_todo',
        parameters: {
          'id': todo.id,
        },
      ),
    );
  }

  @override
  Future<void> updateTodo(Todo todo) async {
    final todoIndex = _todoList.indexWhere((t) => t.id == todo.id);
    var oldTodo = todo;
    try {
      await _localTodoRepository.saveTodo(todo);
      if (todoIndex != -1) {
        oldTodo = _todoList[todoIndex];
        _todoList[todoIndex] = todo;
        _todoListStreamController.add(_todoList);
      }
      if (isInternetConnection(await connectivityResult)) {
        await _networkTodoRepository.updateTodo(todo);
      }
      analyticsEventsWrapper.addEvent(
        AnalyticsEvent(
          name: 'update_todo',
          parameters: {
            'id': todo.id,
          },
        ),
      );
    } on Exception catch (e, s) {
      _todoList[todoIndex] = oldTodo;
      rethrow;
    }
  }

  @override
  Future<void> deleteTodo(String id) async {
    await _localTodoRepository.deleteTodo(id);
    final list = await _localTodoRepository.getTodoList();
    _todoList = list;
    _todoListStreamController.add(_todoList);
    if (isInternetConnection(await connectivityResult)) {
      await _networkTodoRepository.deleteTodo(id);
    }
    analyticsEventsWrapper.addEvent(
      AnalyticsEvent(
        name: 'delete_todo',
        parameters: {
          'id': id,
        },
      ),
    );
  }

  Future<int> _getRevision() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(revisionKey) ?? 1;
  }

  bool isInternetConnection(List<ConnectivityResult> result) {
    final isInternetConnected = result.contains(ConnectivityResult.mobile) ||
        result.contains(ConnectivityResult.wifi);
    return isInternetConnected;
  }
}
