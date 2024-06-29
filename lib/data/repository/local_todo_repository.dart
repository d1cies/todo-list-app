import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/domain/model/todo.dart';
import 'package:todo_list/domain/repository/todo_repository.dart';
import 'package:todo_list/internal/logger.dart';

class LocalTodoRepository implements TodoRepository {
  final String key;

  LocalTodoRepository({
    required this.key,
  });

  final StreamController<List<Todo>> _todoListStreamController =
      StreamController.broadcast();

  @override
  Stream<List<Todo>> get todoListStream => _todoListStreamController.stream;

  List<Todo> _todoList = [];

  @override
  Future<void> init() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final rawData = prefs.getString(key);
      if (rawData == null) return;
      final jsonList = await compute(jsonDecode, rawData) as List<dynamic>;
      final todos = jsonList
          .map<Todo>((json) => Todo.fromJson(json as Map<String, dynamic>))
          .toList();
      _todoList = todos;
      _todoListStreamController.add(_todoList);
      logger.i('Todos loaded');
    } on Exception catch (e, s) {
      logger.f('TodoList load error', error: e, stackTrace: s);
    }
  }

  @override
  FutureOr<List<Todo>> getTodoList() => _todoList;

  @override
  FutureOr<List<Todo>> getNotDoneTodoList() =>
      _todoList.where((todo) => !todo.done).toList();

  @override
  Future<void> saveTodo(Todo todo) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final todoIndex = _todoList.indexWhere((t) => t.id == todo.id);
      if (todoIndex != -1) {
        _todoList[todoIndex] = todo;
      } else {
        _todoList.insert(0, todo);
      }
      _todoListStreamController.add(_todoList);
      await prefs.setString(key, json.encode(_todoList));
      logger.i('Todo saved');
    } on Exception catch (e, s) {
      logger.f('Error saving the todo', error: e, stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<void> deleteTodo(String id) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final todoIndex = _todoList.indexWhere((t) => t.id == id);
      if (todoIndex == -1) {
        logger.e('There is no such todo');
        return;
      }
      _todoList.removeAt(todoIndex);
      _todoListStreamController.add(_todoList);
      await prefs.setString(key, json.encode(_todoList));
      logger.i('Todo deleted');
    } on Exception catch (e, s) {
      logger.f('Error deleting the todo', error: e, stackTrace: s);
      rethrow;
    }
  }

  @override
  int get countDoneTodos => _todoList.where((todo) => todo.done).length;

  @override
  void dispose() {
    _todoListStreamController.close();
  }
}
