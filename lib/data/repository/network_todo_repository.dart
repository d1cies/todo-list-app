import 'dart:async';

import 'package:dio/dio.dart';
import 'package:todo_list/data/dto/request/todo_request.dart';
import 'package:todo_list/data/dto/request/update_todo_list_request.dart';
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
      logger.i('Network todo loaded');
      return mapDtoToTodo(response.element);
    } on DioException catch (e, s) {
      logger.f('Network todo load error', error: e, stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<List<Todo>> getTodoList() async {
    try {
      final response = await _service.getTodoList();
      logger.i('Network todos loaded');
      return response.list.map(mapDtoToTodo).toList();
    } on DioException catch (e, s) {
      logger.f('Network todoList load error', error: e, stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<List<Todo>> updateTodoList(List<Todo> todosList) async {
    try {
      final response = await _service.updateTodoList(
        request: UpdateTodoListRequest(
          list: todosList.map(mapTodoToTodoElement).toList(),
        ),
      );
      logger.i('Network todos updated');
      return response.list.map(mapDtoToTodo).toList();
    } on DioException catch (e, s) {
      logger.f('Network error updating todo list', error: e, stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<Todo> createTodo(Todo todo) async {
    try {
      final response = await _service.createTodo(
        request: TodoRequest(
          element: mapTodoToTodoElement(todo),
        ),
      );
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
        request: TodoRequest(
          element: mapTodoToTodoElement(todo),
        ),
      );
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
      logger.i('Network todo deleted');
      return mapDtoToTodo(response.element);
    } on DioException catch (e, s) {
      logger.f('Network error deleting the todo', error: e, stackTrace: s);
      rethrow;
    }
  }
}
