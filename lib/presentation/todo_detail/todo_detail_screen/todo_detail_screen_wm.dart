import 'dart:async';

import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/domain/model/importance.dart';
import 'package:todo_list/domain/model/todo.dart';
import 'package:todo_list/domain/repository/todo_repository.dart';
import 'package:todo_list/internal/di/configure_dependencies.dart';
import 'package:todo_list/util/wm_base.dart';
import 'todo_detail_screen_model.dart';
import 'todo_detail_screen_widget.dart';

abstract interface class ITodoDetailScreenWidgetModel
    implements IWidgetModel, IThemeProvider {
  // EntityStateNotifier<Todo> get todoStateController;

  ValueNotifier<Importance> get selectedImportanceController;

  ValueNotifier<bool> get deadlineEnableController;

  ValueNotifier<DateTime?> get deadlineController;

  TextEditingController get todoTextController;

  FocusNode get todoTextFocusNode;

  Map<Importance, String> get importanceMap;

  void close();

  void changeTodoImportance(Importance importance);

  void saveTodo();

  void deleteTodo(String? id);

  void selectImportance(Importance importance);

  void switchDeadline({bool? val});
}

TodoDetailScreenWidgetModel defaultTodoDetailScreenWidgetModelFactory(
    BuildContext context) {
  return TodoDetailScreenWidgetModel(
    TodoDetailScreenModel(),
    todoRepository: getIt.get<TodoRepository>(),
  );
}

// TODO: cover with documentation
/// Default widget model for TodoDetailScreenWidget
class TodoDetailScreenWidgetModel
    extends WidgetModel<TodoDetailScreenWidget, TodoDetailScreenModel>
    with ThemeProvider
    implements ITodoDetailScreenWidgetModel {
  TodoDetailScreenWidgetModel(
    super.model, {
    required this.todoRepository,
  });

  final TodoRepository todoRepository;

  @override
  // final EntityStateNotifier<Todo> todoStateController = EntityStateNotifier();

  // Todo? get todo => todoStateController.value.data;

  @override
  ValueNotifier<Importance> selectedImportanceController =
      ValueNotifier(Importance.no);

  @override
  ValueNotifier<bool> deadlineEnableController = ValueNotifier(false);

  @override
  ValueNotifier<DateTime?> deadlineController = ValueNotifier(null);

  @override
  Map<Importance, String> importanceMap = {
    Importance.no: 'Нет',
    Importance.low: 'Низкий',
    Importance.high: '!! Высокий',
  };

  @override
  final TextEditingController todoTextController = TextEditingController();

  @override
  final FocusNode todoTextFocusNode = FocusNode();

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    initTodo();
  }

  @override
  void dispose() {
    todoTextController.dispose();
    todoTextFocusNode.dispose();
    super.dispose();
  }

  void initTodo() {
    final todo = widget.todo;
    if (todo != null) {
      todoTextController.text = widget.todo?.text ?? '';
      selectedImportanceController.value =
          widget.todo?.importance ?? Importance.no;
      if (todo.deadline != null) {
        deadlineEnableController.value = true;
        deadlineController.value = widget.todo?.deadline;
      }
    }
  }

  @override
  void close() {
    router.maybePop();
  }

  @override
  void changeTodoImportance(Importance importance) {
    selectedImportanceController.value = importance;
  }

  @override
  Future<void> saveTodo() async {
    if (widget.todo == null) {
      final todo = Todo.create(
        text: todoTextController.text,
        importance: selectedImportanceController.value,
        done: widget.todo?.done ?? false,
        deadline: deadlineController.value,
      );
      await todoRepository.saveTodo(todo);
    } else {
      await todoRepository.saveTodo(
        widget.todo!.copyWith(
          text: todoTextController.text,
          importance: selectedImportanceController.value,
          done: widget.todo?.done ?? false,
          deadline: deadlineController.value,
        ),
      );
    }
    close();
  }

  @override
  Future<void> deleteTodo(String? id) async {
    if (id == null) return;
    await todoRepository.deleteTodo(id);
  }

  @override
  void selectImportance(Importance importance) =>
      selectedImportanceController.value = importance;

  @override
  Future<void> switchDeadline({bool? val}) async {
    deadlineEnableController.value = val ?? !deadlineEnableController.value;
    if (deadlineEnableController.value) {
      await selectDate();
    } else {
      deadlineController.value = null;
    }
  }

  Future<void> selectDate() async {
    deadlineController.value = await showDatePicker(
      // locale: const Locale('ru', 'RU'),
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 1000),
      ),
    );
    if (deadlineController.value == null) {
      switchDeadline(val: false);
    }
  }
}
