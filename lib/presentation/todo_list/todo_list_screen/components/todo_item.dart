import 'package:flutter/material.dart';
import 'package:todo_list/app/theme/theme_color/theme_colors.dart';
import 'package:todo_list/domain/model/todo.dart';
import 'package:todo_list/presentation/todo_list/todo_list_screen/components/item_checkbox.dart';
import 'package:todo_list/presentation/todo_list/todo_list_screen/components/item_text.dart';

class TodoItem extends StatefulWidget {
  final Todo todo;
  final BorderRadius borderRadius;
  final ValueSetter<String> removeTodo;
  final ValueSetter<Todo> doneTodo;
  final ValueSetter<Todo> editTodo;

  const TodoItem({
    super.key,
    required this.todo,
    required this.borderRadius,
    required this.removeTodo,
    required this.doneTodo,
    required this.editTodo,
  });

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  double _iconOffset = 0;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ThemeColors>()!;
    return Dismissible(
      key: ValueKey<Todo>(widget.todo),
      background: ColoredBox(
        color: colors.green,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Positioned(
              left: _iconOffset > 0 ? (_iconOffset * 250) : 0,
              child: Icon(
                Icons.done,
                color: colors.white,
                size: 24,
              ),
            ),
          ],
        ),
      ),
      secondaryBackground: ColoredBox(
        color: colors.red,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Positioned(
              right: _iconOffset > 0 ? (_iconOffset * 250) : 0,
              child: Icon(
                Icons.delete,
                color: colors.white,
                size: 24,
              ),
            ),
          ],
        ),
      ),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.startToEnd) {
          widget.doneTodo(widget.todo);
        }
        return direction == DismissDirection.endToStart;
      },
      onUpdate: (details) {
        setState(() {
          _iconOffset = details.progress;
        });
      },
      onDismissed: (_) => widget.removeTodo(widget.todo.id),
      child: InkWell(
        onTap: () => widget.editTodo(widget.todo),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: widget.borderRadius,
            color: colors.backSecondary,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 14,
              horizontal: 16,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ItemCheckbox(
                  todo: widget.todo,
                  doneTodo: widget.doneTodo,
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: ItemText(
                    todo: widget.todo,
                  ),
                ),
                const SizedBox(width: 14),
                Icon(
                  Icons.info_outline,
                  color: colors.labelTertiary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
