import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/util/wm_base.dart';
import 'todo_list_screen_model.dart';
import 'todo_list_screen_widget.dart';

abstract interface class ITodoListScreenWidgetModel
    implements IWidgetModel, IThemeProvider {}

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
}
