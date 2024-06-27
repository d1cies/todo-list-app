import 'dart:async';

import 'package:todo_list/domain/model/todo.dart';
import 'package:todo_list/util/lifecycle_component.dart';

abstract class TodoRepository implements LifeCycleComponent {
  Stream<List<Todo>> get todoListStream;

  FutureOr<List<Todo>> getTodoList();

  FutureOr<List<Todo>> getNotDoneTodoList();

  Future<void> saveTodo(Todo todo);

  Future<void> deleteTodo(String id);

  int get countDoneTodos;
}
