import 'dart:async';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/data/mapper/todo_mapper.dart';
import 'package:todo_list/data/service/todo_service.dart';
import 'package:todo_list/domain/model/todo.dart';
import 'package:todo_list/domain/repository/network_todo_repository.dart';
import 'package:todo_list/internal/logger.dart';

class NetworkTodoRepository extends INetworkTodoRepository {
  final TodoService _service;
  final String revisionKey;

  NetworkTodoRepository(
    this._service, {
    required this.revisionKey,
  });

  @override
  Future<Todo> getTodo(String id) async {
    try {
      final response = await _service.getTodo(id);
      await _setRevision(response.revision);
      logger.i('Network todo loaded');
      return mapDtoToTodo(response.element);
    } on DioException catch (e, s) {
      logger.f('Network todo load error', error: e, stackTrace: s);
      rethrow;
    }
  }

  @override
  FutureOr<List<Todo>> getTodoList() async {
    try {
      final response = await _service.getTodoList();
      await _setRevision(response.revision);
      logger.i('Network todos loaded');
      return response.list.map(mapDtoToTodo).toList();
    } on DioException catch (e, s) {
      logger.f('Network todoList load error', error: e, stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<Todo> createTodo(Todo todo) async {
    try {
      final response =
          await _service.createTodo(request: mapTodoToRequest(todo));
      await _setRevision(response.revision);
      logger.i('Network todo created');
      return mapDtoToTodo(response.element);
    } on DioException catch (e, s) {
      logger.f('Network error creating the todo', error: e, stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<Todo> updateTodo(Todo todo) async {
    try {
      final response = await _service.updateTodo(
        todo.id,
        request: mapTodoToRequest(todo),
      );
      await _setRevision(response.revision);
      logger.i('Network todo updated');
      return mapDtoToTodo(response.element);
    } on DioException catch (e, s) {
      logger.f('Network error updating the todo', error: e, stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<Todo> deleteTodo(String id) async {
    try {
      final response = await _service.deleteTodo(id);
      await _setRevision(response.revision);
      logger.i('Network todo deleted');
      return mapDtoToTodo(response.element);
    } on DioException catch (e, s) {
      logger.f('Network error deleting the todo', error: e, stackTrace: s);
      rethrow;
    }
  }

  Future<void> _setRevision(int revision) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(revisionKey, revision);
  }
}
