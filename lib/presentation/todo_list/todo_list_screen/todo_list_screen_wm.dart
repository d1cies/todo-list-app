import 'dart:async';

import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/domain/model/todo.dart';
import 'package:todo_list/domain/use_case/todo_use_case.dart';
import 'package:todo_list/internal/di/configure_dependencies.dart';
import 'package:todo_list/presentation/todo_list/todo_list_screen/todo_list_screen_model.dart';
import 'package:todo_list/presentation/todo_list/todo_list_screen/todo_list_screen_widget.dart';
import 'package:todo_list/router/app_router.dart';
import 'package:todo_list/util/wm_base.dart';

import '../../../internal/logger.dart';

abstract interface class ITodoListScreenWidgetModel
    implements IWidgetModel, IThemeProvider {
  EntityStateNotifier<List<Todo>> get todoListState;

  ValueNotifier<bool> get showDoneTodosController;

  ValueNotifier<int> get doneTodoCountController;

  void createTodo(Todo todo);

  void completeTodo(Todo todo);

  void deleteTodo(String todoId);

  void toTodoDetail(Todo? todo);

  void changeDoneTodosVisibility();

  Future<void> refreshTodoList();

  int get doneTodosCount;
}

TodoListScreenWidgetModel defaultTodoListScreenWidgetModelFactory(
    BuildContext context) {
  return TodoListScreenWidgetModel(
    TodoListScreenModel(),
    todoUseCase: getIt.get<ITodoUseCase>(),
  );
}

// TODO: cover with documentation
/// Default widget model for TodoListScreenWidget
class TodoListScreenWidgetModel
    extends WidgetModel<TodoListScreenWidget, TodoListScreenModel>
    with ThemeProvider
    implements ITodoListScreenWidgetModel {
  TodoListScreenWidgetModel(
    super.model, {
    required this.todoUseCase,
  });

  final ITodoUseCase todoUseCase;

  @override
  final EntityStateNotifier<List<Todo>> todoListState = EntityStateNotifier();

  @override
  final ValueNotifier<bool> showDoneTodosController = ValueNotifier(false);

  @override
  final ValueNotifier<int> doneTodoCountController = ValueNotifier(0);

  StreamSubscription<List<Todo>>? todoListStreamSb;

  @override
  Future<void> initWidgetModel() async {
    super.initWidgetModel();
    todoListState.loading();
    todoListStreamSb = todoUseCase.todoListStream.listen((todoList) {
      /// sort by created time
      todoList.sort((a, b) => b.createdAt.compareTo(a.createdAt));

      /// update list
      currentTodoList(todoList);

      /// update done counter
      doneTodoCountController.value = doneTodosCount;
    });
  }

  @override
  Future<void> refreshTodoList() async {
    logger.i('Refresh list by hands');
    todoListState.loading();
    try {
      await todoUseCase.getTodoList();
    } on Exception catch (e) {
      todoListState.error(e);
    }
  }

  void currentTodoList(List<Todo> list) {
    if (showDoneTodosController.value) {
      todoListState.content(list);
      return;
    }
    todoListState.content(list.where((todo) => !todo.done).toList());
  }

  @override
  void dispose() {
    todoListState.dispose();
    showDoneTodosController.dispose();
    todoListStreamSb?.cancel();
    super.dispose();
  }

  @override
  Future<void> createTodo(Todo todo) async {
    await todoUseCase.updateTodo(todo);
  }

  @override
  Future<void> completeTodo(Todo todo) async {
    await todoUseCase.updateTodo(
      todo.copyWith(
        done: !todo.done,
      ),
    );
  }

  @override
  Future<void> deleteTodo(String todoId) async {
    await todoUseCase.deleteTodo(todoId);
  }

  @override
  void toTodoDetail(Todo? todo) {
    router.navigate(TodoDetailRoute(todo: todo));
  }

  @override
  int get doneTodosCount => todoUseCase.countDoneTodos;

  @override
  Future<void> changeDoneTodosVisibility() async {
    showDoneTodosController.value = !showDoneTodosController.value;
    currentTodoList(todoUseCase.allCurrentTodoList);
  }
}
