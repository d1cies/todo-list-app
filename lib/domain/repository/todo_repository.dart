import 'dart:async';

import 'package:todo_list/domain/model/todo.dart';

abstract class TodoRepository {

  Stream<List<Todo>> get todoListStream;

  Future<List<Todo>> getTodoList();

  Future<void> saveTodo(Todo todo);

  Future<void> deleteTodo(String id);
}
