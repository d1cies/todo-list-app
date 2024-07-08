import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/domain/model/todo.dart';
import 'package:todo_list/domain/repository/local_todo_repository.dart';
import 'package:todo_list/domain/repository/network_todo_repository.dart';
import 'package:todo_list/internal/logger.dart';
import 'package:todo_list/util/lifecycle_component.dart';

abstract class ITodoUseCase implements LifeCycleComponent {
  Stream<List<Todo>> get todoListStream;

  int get countDoneTodos;

  Future<void> getTodoList();

  List<Todo> get allCurrentTodoList;

  Future<void> getTodo(String id);

  Future<void> createTodo(Todo todo);

  Future<void> updateTodo(Todo todo);

  Future<void> deleteTodo(String id);
}

class TodoUseCase implements ITodoUseCase {
  final ILocalTodoRepository _localTodoRepository;
  final INetworkTodoRepository _networkTodoRepository;
  final String revisionKey;

  TodoUseCase({
    required ILocalTodoRepository localTodoRepository,
    required INetworkTodoRepository networkTodoRepository,
    required this.revisionKey,
  })  : _localTodoRepository = localTodoRepository,
        _networkTodoRepository = networkTodoRepository;

  final BehaviorSubject<List<Todo>> _todoListStreamController =
      BehaviorSubject();

  late final StreamSubscription<List<ConnectivityResult>>?
      _connectivitySubscription;

  @override
  Stream<List<Todo>> get todoListStream => _todoListStreamController.stream;

  @override
  int get countDoneTodos => _todoList.where((todo) => todo.done).length;

  List<Todo> _todoList = [];

  Future<List<ConnectivityResult>> get connectivityResult =>
      Connectivity().checkConnectivity();

  @override
  void init() {
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
      await syncLocalAndNetworkTodos();
    } else {
      logger.i('NO INTERNET');
      final localTodoList = await _localTodoRepository.getTodoList();
      _todoListStreamController.add(localTodoList);
      _todoList = localTodoList;
    }
  }

  Future<void> syncLocalAndNetworkTodos() async {
    final localRevision = await _getRevision();
    final networkTodoList = await _networkTodoRepository.getTodoList();
    final localTodoList = await _localTodoRepository.getTodoList();
    final networkRevision = await _getRevision();

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
              }
            }
          }
        }
        // иначе значения не меняются, видимо, такая логика на бэкенде
        // await _networkTodoRepository.updateTodoList([]);
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

  @override
  List<Todo> get allCurrentTodoList => _todoListStreamController.value;

  @override
  Future<void> createTodo(Todo todo) async {
    await _localTodoRepository.saveTodo(todo);
    _todoList.insert(0, todo);
    _todoListStreamController.add(_todoList);
    if (isInternetConnection(await connectivityResult)) {
      await _networkTodoRepository.createTodo(todo);
    }
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
    } on Exception catch (e, s) {
      _todoList[todoIndex] = oldTodo;
      rethrow;
    }
  }

  @override
  Future<void> deleteTodo(String id) async {
    await _localTodoRepository.deleteTodo(id);
    final todoIndex = _todoList.indexWhere((t) => t.id == id);
    if (todoIndex != -1) {
      _todoList.removeAt(todoIndex);
      _todoListStreamController.add(_todoList);
    }
    if (isInternetConnection(await connectivityResult)) {
      await _networkTodoRepository.deleteTodo(id);
    }
  }

  @override
  Future<void> getTodo(String id) async {
    await _networkTodoRepository.getTodo(id);
  }

  Future<int?> _getRevision() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(revisionKey);
  }

  bool isInternetConnection(List<ConnectivityResult> result) {
    final isInternetConnected = result.contains(ConnectivityResult.mobile) ||
        result.contains(ConnectivityResult.wifi);
    return isInternetConnected;
  }
}
