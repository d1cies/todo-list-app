import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/domain/model/importance.dart';
import 'package:todo_list/util/wm_base.dart';
import 'todo_detail_screen_model.dart';
import 'todo_detail_screen_widget.dart';

abstract interface class ITodoDetailScreenWidgetModel
    implements IWidgetModel, IThemeProvider {
  EntityStateNotifier<Importance> get selectedImportance;

  TextEditingController get todoTextController;

  FocusNode get todoTextFocusNode;

  List<Importance> get importanceList;

  void close();
}

TodoDetailScreenWidgetModel defaultTodoDetailScreenWidgetModelFactory(
    BuildContext context) {
  return TodoDetailScreenWidgetModel(TodoDetailScreenModel());
}

// TODO: cover with documentation
/// Default widget model for TodoDetailScreenWidget
class TodoDetailScreenWidgetModel
    extends WidgetModel<TodoDetailScreenWidget, TodoDetailScreenModel>
    with ThemeProvider
    implements ITodoDetailScreenWidgetModel {
  TodoDetailScreenWidgetModel(super.model);

  @override
  EntityStateNotifier<Importance> selectedImportance = EntityStateNotifier();

  @override
  List<Importance> importanceList = List.of(
    [
      Importance.no,
      Importance.low,
      Importance.high,
    ],
  );

  @override
  final TextEditingController todoTextController = TextEditingController();

  @override
  final FocusNode todoTextFocusNode = FocusNode();

  @override
  void dispose() {
    todoTextController.dispose();
    todoTextFocusNode.dispose();
    super.dispose();
  }

  @override
  void close() {
    router.maybePop();
  }
}
