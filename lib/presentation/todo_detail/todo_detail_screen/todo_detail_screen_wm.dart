import 'dart:async';

import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/domain/model/importance.dart';
import 'package:todo_list/domain/model/todo.dart';
import 'package:todo_list/domain/use_case/todo_use_case.dart';
import 'package:todo_list/internal/di/configure_dependencies.dart';
import 'package:todo_list/util/device_info.dart';
import 'package:todo_list/util/wm_base.dart';
import 'package:todo_list/presentation/todo_detail/todo_detail_screen/todo_detail_screen_model.dart';
import 'package:todo_list/presentation/todo_detail/todo_detail_screen/todo_detail_screen_widget.dart';

abstract interface class ITodoDetailScreenWidgetModel
    implements IWidgetModel, IThemeProvider {
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
    todoUseCase: getIt.get<ITodoUseCase>(),
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
    required this.todoUseCase,
  });

  final ITodoUseCase todoUseCase;

  @override
  final ValueNotifier<Importance> selectedImportanceController =
      ValueNotifier(Importance.basic);

  @override
  final ValueNotifier<bool> deadlineEnableController = ValueNotifier(false);

  @override
  final ValueNotifier<DateTime?> deadlineController = ValueNotifier(null);

  @override
  late final Map<Importance, String> importanceMap;

  @override
  final TextEditingController todoTextController = TextEditingController();

  @override
  final FocusNode todoTextFocusNode = FocusNode();

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    importanceMap = {
      Importance.basic: localizations.no,
      Importance.low: localizations.low,
      Importance.important: '!! ${localizations.high}',
    };
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
          widget.todo?.importance ?? Importance.basic;
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
      final deviceId = await getDeviceId();
      final todo = Todo.create(
        text: todoTextController.text,
        importance: selectedImportanceController.value,
        done: widget.todo?.done ?? false,
        deadline: deadlineController.value,
        lastUpdatedBy: deviceId,
      );
      await todoUseCase.createTodo(todo);
    } else {
      await todoUseCase.updateTodo(
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
    await todoUseCase.deleteTodo(id);
    close();
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
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: color.blue,
              surface: color.white,
              onSurface: color.labelPrimary,
            ),
          ),
          child: child!,
        );
      },
    );
    if (deadlineController.value == null) {
      await switchDeadline(val: false);
    }
  }
}
