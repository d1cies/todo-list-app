import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/domain/model/todo.dart';
import 'package:todo_list/domain/repository/local_todo_repository.dart';
import 'package:todo_list/domain/repository/network_todo_repository.dart';
import 'package:todo_list/util/lifecycle_component.dart';

abstract class ITodoUseCase implements LifeCycleComponent {
  Stream<List<Todo>> get todoListStream;

  int get countDoneTodos;

  Future<void> getTodoList();

  Future<void> allCurrentTodoList();

  Future<void> getNotDoneTodoList();

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

  @override
  Stream<List<Todo>> get todoListStream => _todoListStreamController.stream;

  int get countDoneTodos => _todoList.where((todo) => todo.done).length;

  List<Todo> _todoList = [];

  @override
  void init() {}

  @override
  void dispose() {
    _todoListStreamController.close();
  }

  Future<void> getTodoList() async {
    final int? localRevision = await _getRevision();
    final networkTodoList = await _networkTodoRepository.getTodoList();
    final localTodoList = await _localTodoRepository.getTodoList();
    final int? networkRevision = await _getRevision();
    if (localRevision == networkRevision) {
      _todoListStreamController.add(networkTodoList);
      _todoList = networkTodoList;
    } else {
      //TODO add handler in next homework (now not required)
      _todoListStreamController.add(networkTodoList);
      _todoList = networkTodoList;
    }
  }

  @override
  Future<void> allCurrentTodoList() async {
    _todoListStreamController.add(_todoList);
  }

  @override
  Future<void> getNotDoneTodoList() async {
    _todoListStreamController
        .add(_todoList.where((todo) => !todo.done).toList());
  }

  @override
  Future<void> createTodo(Todo todo) async {
    final createdTodo = await _networkTodoRepository.createTodo(todo);
    await _localTodoRepository.saveTodo(todo);
    _todoList.insert(0, createdTodo);
    _todoListStreamController.add(_todoList);
  }

  @override
  Future<void> updateTodo(Todo todo) async {
    final todoIndex = _todoList.indexWhere((t) => t.id == todo.id);
    Todo oldTodo = todo;
    ;
    if (todoIndex != -1) {
      oldTodo = _todoList[todoIndex];
      _todoList[todoIndex] = todo;
      _todoListStreamController.add(_todoList);
    }
    try {
      await _networkTodoRepository.updateTodo(todo);
      await _localTodoRepository.saveTodo(todo);
    } on Exception catch (e, s) {
      _todoList[todoIndex] = oldTodo;
      rethrow;
    }
  }

  @override
  Future<void> deleteTodo(String id) async {
    final deletedTodo = await _networkTodoRepository.deleteTodo(id);
    await _localTodoRepository.deleteTodo(id);
    final todoIndex = _todoList.indexWhere((t) => t.id == deletedTodo?.id);
    if (todoIndex != -1) {
      _todoList.removeAt(todoIndex);
      _todoListStreamController.add(_todoList);
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
}
