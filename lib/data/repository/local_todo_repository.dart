import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/domain/model/todo.dart';
import 'package:todo_list/domain/repository/local_todo_repository.dart';
import 'package:todo_list/internal/logger.dart';

class LocalTodoRepository implements ILocalTodoRepository {
  final String todoListKey;
  final String revisionKey;

  LocalTodoRepository({
    required this.todoListKey,
    required this.revisionKey,
  });

  List<Todo> _todoList = [];

  @override
  Future<void> init() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final rawData = prefs.getString(todoListKey);
      if (rawData == null) return;
      final jsonList = await compute(jsonDecode, rawData) as List<dynamic>;
      final todos = jsonList
          .map<Todo>((json) => Todo.fromJson(json as Map<String, dynamic>))
          .toList();
      _todoList = todos;
      logger.i('Local todos loaded');
    } on Exception catch (e, s) {
      logger.f('Local todoList load error', error: e, stackTrace: s);
    }
  }

  @override
  FutureOr<List<Todo>> getTodoList() => _todoList;

  @override
  FutureOr<List<Todo>> getNotDoneTodoList() =>
      _todoList.where((todo) => !todo.done).toList();

  @override
  Future<Todo> saveTodo(Todo todo) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final todoIndex = _todoList.indexWhere((t) => t.id == todo.id);
      if (todoIndex != -1) {
        _todoList[todoIndex] = todo;
      } else {
        _todoList.insert(0, todo);
      }
      await prefs.setString(todoListKey, json.encode(_todoList));
      logger.i('Local todo saved');
      return todo;
    } on Exception catch (e, s) {
      logger.f('Local error saving the todo', error: e, stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<Todo?> deleteTodo(String id) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final todoIndex = _todoList.indexWhere((t) => t.id == id);
      if (todoIndex == -1) {
        logger.e('Local there is no such todo');
        return null;
      }
      final todo = _todoList[todoIndex];
      _todoList.removeAt(todoIndex);
      await prefs.setString(todoListKey, json.encode(_todoList));
      logger.i('Local todo deleted');
      return todo;
    } on Exception catch (e, s) {
      logger.f('Local error deleting the todo', error: e, stackTrace: s);
      rethrow;
    }
  }

  int get countDoneTodos => _todoList.where((todo) => todo.done).length;

  @override
  void dispose() {}
}
