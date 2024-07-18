import 'package:flutter/material.dart';
import 'package:todo_list/domain/model/todo.dart';
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

    if (index == 0) {
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
      padding: const EdgeInsets.symmetric(horizontal: 8),
      sliver: SliverList.builder(
        itemCount: todos.length + 1,
        itemBuilder: (context, index) {
          if (index == todos.length) {
            return InkWell(
              onTap: () => wm.toTodoDetail(null),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: _buildBorderRadius(index, todos.length),
                  color: wm.color.backSecondary,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 50,
                  ),
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      wm.localizations.newTodo,
                      style:
                          wm.text.body.copyWith(color: wm.color.supportSeparator),
                    ),
                  ),
                ),
              ),
            );
          }
          final todo = todos[index];
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
