import 'dart:async';

import 'package:todo_list/domain/model/todo.dart';
import 'package:todo_list/util/lifecycle_component.dart';

abstract class ILocalTodoRepository implements LifeCycleComponent {
  FutureOr<List<Todo>> getTodoList();

  FutureOr<List<Todo>> getNotDoneTodoList();

  Future<Todo> saveTodo(Todo todo);

  Future<Todo?> deleteTodo(String id);
}
