import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_list/domain/model/todo.dart';
import 'package:todo_list/presentation/todo_list/todo_list_screen/components/complete_title.dart';
import 'package:todo_list/presentation/todo_list/todo_list_screen/components/todo_item.dart';
import 'package:todo_list/presentation/todo_list/todo_list_screen/todo_list_screen_wm.dart';

class SliverTodoList extends StatelessWidget {
  final List<Todo> todos;
  final ITodoListScreenWidgetModel wm;
  final bool showDoneTodos;

  const SliverTodoList({
    super.key,
    required this.todos,
    required this.wm,
    required this.showDoneTodos,
  });

  BorderRadius _buildBorderRadius(int index, int length) {
    const radius = Radius.circular(8);

    if (length == 1) {
      return const BorderRadius.all(radius);
    }

    if (index == 1) {
      return const BorderRadius.only(
        topLeft: radius,
        topRight: radius,
      );
    }

    if (index == length) {
      return const BorderRadius.only(
        bottomLeft: radius,
        bottomRight: radius,
      );
    }

    return BorderRadius.zero;
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      sliver: SliverList.builder(
        itemCount: todos.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return CompleteTitle(
              doneTodos: wm.doneTodosCount,
              icon: showDoneTodos ? Icons.visibility_off : Icons.visibility,
              switchShowDone: wm.changeDoneTodosVisibility,
            );
          }
          final todo = todos[index - 1];
          return TodoItem(
            todo: todo,
            borderRadius: _buildBorderRadius(index, todos.length),
            removeTodo: wm.deleteTodo,
            doneTodo: wm.completeTodo,
            editTodo: (_) => wm.toTodoDetail(todo),
          );
        },
      ),
    );
  }
}
