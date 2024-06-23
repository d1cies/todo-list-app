import 'dart:async';

import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/domain/model/todo.dart';
import 'package:todo_list/domain/repository/todo_repository.dart';
import 'package:todo_list/internal/di/configure_dependencies.dart';
import 'package:todo_list/router/app_router.dart';
import 'package:todo_list/util/wm_base.dart';
import 'todo_list_screen_model.dart';
import 'todo_list_screen_widget.dart';

abstract interface class ITodoListScreenWidgetModel
    implements IWidgetModel, IThemeProvider {
  EntityStateNotifier<List<Todo>> get todoListState;

  ValueNotifier<bool> get showDoneTodosController;

  void createTodo(Todo todo);

  void completeTodo(Todo todo);

  void deleteTodo(String todoId);

  void toTodoDetail(Todo? todo);

  void changeDoneTodosVisibility();

  int get doneTodosCount;
}

TodoListScreenWidgetModel defaultTodoListScreenWidgetModelFactory(
    BuildContext context) {
  return TodoListScreenWidgetModel(
    TodoListScreenModel(),
    todoRepository: getIt.get<TodoRepository>(),
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
    required this.todoRepository,
  });

  final TodoRepository todoRepository;

  @override
  final EntityStateNotifier<List<Todo>> todoListState = EntityStateNotifier();

  @override
  final ValueNotifier<bool> showDoneTodosController = ValueNotifier(false);

  StreamSubscription<List<Todo>>? todoListStreamSb;

  @override
  Future<void> initWidgetModel() async {
    super.initWidgetModel();
    todoListStreamSb = todoRepository.todoListStream.listen((_) {
      loadTodoList();
    });
  }

  Future<void> loadTodoList() async {
    todoListState.loading();
    try {
      if (showDoneTodosController.value) {
        todoListState.content(await todoRepository.getTodoList());
      } else {
        todoListState.content(await todoRepository.getNotDoneTodoList());
      }
    } catch (e) {
      todoListState.error();
    }
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
    await todoRepository.saveTodo(todo);
  }

  @override
  Future<void> completeTodo(Todo todo) async {
    await todoRepository.saveTodo(
      todo.copyWith(
        done: !todo.done,
      ),
    );
  }

  @override
  Future<void> deleteTodo(String todoId) async {
    await todoRepository.deleteTodo(todoId);
  }

  @override
  void toTodoDetail(Todo? todo) {
    router.navigate(TodoDetailRoute(todo: todo));
  }

  @override
  int get doneTodosCount => todoRepository.countDoneTodos;

  @override
  Future<void> changeDoneTodosVisibility() async {
    showDoneTodosController.value = !showDoneTodosController.value;
    final visibility = showDoneTodosController.value;
    if (visibility) {
      todoListState.content(await todoRepository.getTodoList());
    } else {
      todoListState.content(await todoRepository.getNotDoneTodoList());
    }
  }
}
