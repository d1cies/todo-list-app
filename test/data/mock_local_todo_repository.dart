import 'dart:async';

import 'package:mocktail/mocktail.dart';
import 'package:todo_list/domain/model/todo.dart';
import 'package:todo_list/domain/repository/local_todo_repository.dart';

class MockLocalTodoRepository extends Mock implements ILocalTodoRepository {
  List<Todo> todoList = [];

  @override
  Future<Todo?> deleteTodo(String id) {
    final todoIndex = todoList.indexWhere((t) => t.id == id);
    if (todoIndex == -1) {
      return Future.value();
    }
    final todo = todoList[todoIndex];
    todoList.removeAt(todoIndex);
    return Future.value(todo);
  }

  @override
  void dispose() {}

  @override
  FutureOr<List<Todo>> getNotDoneTodoList() =>
      todoList.where((todo) => !todo.done).toList();

  @override
  FutureOr<List<Todo>> getTodoList() => todoList;

  @override
  void init() {}

  @override
  Future<Todo> saveTodo(Todo todo) {
    final todoIndex = todoList.indexWhere((t) => t.id == todo.id);
    if (todoIndex != -1) {
      todoList[todoIndex] = todo;
    } else {
      todoList.insert(0, todo);
    }
    return Future.value(todo);
  }
}
