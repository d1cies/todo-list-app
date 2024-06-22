import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/app/theme/theme_color/theme_colors.dart';
import 'package:todo_list/app/theme/theme_text/theme_text.dart';
import 'package:todo_list/domain/model/todo.dart';

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
  double _iconOffset = 0.0;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ThemeColors>()!;
    final text = Theme.of(context).extension<ThemeText>()!;
    final deadline = widget.todo.deadline;
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
      confirmDismiss: (DismissDirection direction) async {
        if (direction == DismissDirection.startToEnd) {
          widget.doneTodo(widget.todo);
        }
        return direction == DismissDirection.endToStart;
      },
      onUpdate: (details) {
          setState(() {
            _iconOffset = details.progress;
            print(_iconOffset);
          });

      },
      onDismissed: (_) => widget.removeTodo(widget.todo.id),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: widget.borderRadius,
          color: colors.backSecondary,
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          leading: SizedBox(
            width: 24,
            height: 24,
            child: Checkbox(
              value: widget.todo.done,
              onChanged: (_) => widget.doneTodo(widget.todo),
            ),
          ),
          onTap: () => widget.editTodo(widget.todo),
          title: Text(
            widget.todo.text,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: text.body.copyWith(
              decoration:
                  widget.todo.done ? TextDecoration.lineThrough : null,
              decorationColor: colors.supportSeparator,
              color: widget.todo.done ? colors.supportSeparator : null,
            ),
          ),
          subtitle: deadline != null
              ? Text(
                  DateFormat.yMd().format(deadline),
                )
              : null,
          trailing: Icon(
            Icons.info_outline,
            color: colors.labelTertiary,
          ),
        ),
      ),
    );
  }

// AlignmentGeometry _getActualAligment(double offset) {}
}
