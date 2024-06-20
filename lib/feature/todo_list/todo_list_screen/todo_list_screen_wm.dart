import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/domain/model/todo.dart';
import 'package:todo_list/router/app_router.dart';
import 'package:todo_list/util/wm_base.dart';
import 'todo_list_screen_model.dart';
import 'todo_list_screen_widget.dart';

abstract interface class ITodoListScreenWidgetModel
    implements IWidgetModel, IThemeProvider {
  EntityStateNotifier<List<Todo>> get todoListState;

  void completeTodo(Todo todo);

  void removeTodo(Todo todo);

  void addNewTodo();
}

TodoListScreenWidgetModel defaultTodoListScreenWidgetModelFactory(
    BuildContext context) {
  return TodoListScreenWidgetModel(TodoListScreenModel());
}

// TODO: cover with documentation
/// Default widget model for TodoListScreenWidget
class TodoListScreenWidgetModel
    extends WidgetModel<TodoListScreenWidget, TodoListScreenModel>
    with ThemeProvider
    implements ITodoListScreenWidgetModel {
  TodoListScreenWidgetModel(super.model);

  @override
  final EntityStateNotifier<List<Todo>> todoListState = EntityStateNotifier();

  @override
  void initWidgetModel() {
    super.initWidgetModel();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void completeTodo(Todo todo) {}

  @override
  void removeTodo(Todo todo) {}

  @override
  void addNewTodo() {
    router.navigate(TodoDetailRoute());
  }
}
