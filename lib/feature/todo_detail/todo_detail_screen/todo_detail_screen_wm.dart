import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/util/wm_base.dart';
import 'todo_detail_screen_model.dart';
import 'todo_detail_screen_widget.dart';

abstract interface class ITodoDetailScreenWidgetModel implements IWidgetModel, IThemeProvider {
}

TodoDetailScreenWidgetModel defaultTodoDetailScreenWidgetModelFactory(BuildContext context) {
  return TodoDetailScreenWidgetModel(TodoDetailScreenModel());
}

// TODO: cover with documentation
/// Default widget model for TodoDetailScreenWidget
class TodoDetailScreenWidgetModel extends WidgetModel<TodoDetailScreenWidget, TodoDetailScreenModel>
    with ThemeProvider
    implements ITodoDetailScreenWidgetModel {

  TodoDetailScreenWidgetModel(super.model);
}
