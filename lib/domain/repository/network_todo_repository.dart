import 'dart:async';

import 'package:todo_list/domain/model/todo.dart';

abstract class INetworkTodoRepository {
  FutureOr<List<Todo>> getTodoList();

  Future<Todo> getTodo(String id);

  Future<Todo> createTodo(Todo todo);

  Future<Todo> updateTodo(Todo todo);

  Future<Todo?> deleteTodo(String id);
}
