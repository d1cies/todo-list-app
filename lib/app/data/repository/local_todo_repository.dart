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
  Future<List<Todo>> getTodoList() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final rawData = prefs.getString(key);
      if (rawData == null) return [];
      final jsonList = await compute(jsonDecode, rawData) as List<dynamic>;
      final todos = jsonList.map((json) => Todo.fromJson(json)).toList();
      _todoList = todos;
      _todoListStreamController.add(_todoList);
      logger.i('Todos loaded');
      return _todoList;
    } catch (e, s) {
      logger.f('TodoList load error', error: e, stackTrace: s);
      return [];
    }
  }

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
      prefs.setString(key, json.encode(_todoList));
      logger.i('Todo saved');
    } catch (e, s) {
      logger.f('Error saving the todo', error: e, stackTrace: s);
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
      prefs.setString(key, json.encode(_todoList));
      logger.i('Todo deleted');
    } catch (e, s) {
      logger.f('Error deleting the todo', error: e, stackTrace: s);
    }
  }
}