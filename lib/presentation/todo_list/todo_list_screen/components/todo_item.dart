import 'package:flutter/material.dart';
import 'package:todo_list/app/theme/theme_color/theme_colors.dart';
import 'package:todo_list/app/theme/theme_text/theme_text.dart';
import 'package:todo_list/domain/model/importance.dart';
import 'package:todo_list/domain/model/todo.dart';
import 'package:todo_list/extensions/date_format.dart';

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
                SizedBox(
                  width: 24,
                  height: 24,
                  child: Checkbox(
                    value: widget.todo.done,
                    onChanged: (_) => widget.doneTodo(widget.todo),
                    side: WidgetStateBorderSide.resolveWith(
                      (states) {
                        if (!states.contains(WidgetState.selected) &&
                            widget.todo.importance == Importance.important) {
                          return BorderSide(
                            width: 2,
                            color: colors.red,
                          );
                        }
                        if (!states.contains(WidgetState.selected)) {
                          return BorderSide(
                            width: 2,
                            color: colors.supportSeparator,
                          );
                        }
                        return null;
                      },
                    ),
                    fillColor: WidgetStateProperty.resolveWith(
                      (states) {
                        if (!states.contains(WidgetState.selected) &&
                            widget.todo.importance == Importance.important) {
                          return colors.red.withOpacity(0.16);
                        }
                        if (states.contains(WidgetState.selected)) {
                          return colors.green;
                        }
                        return Colors.transparent;
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                          text: widget.todo.importance == Importance.important
                              ? '!! '
                              : '',
                          style: text.body.copyWith(
                            color: colors.red,
                          ),
                          children: [
                            TextSpan(
                              text: widget.todo.text,
                              style: text.body.copyWith(
                                decoration: widget.todo.done
                                    ? TextDecoration.lineThrough
                                    : null,
                                decorationColor: colors.supportSeparator,
                                color: widget.todo.done
                                    ? colors.supportSeparator
                                    : null,
                              ),
                            ),
                          ]),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (deadline != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          deadline.fromDateToString(),
                        ),
                      ),
                  ],
                ),
                const Spacer(),
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
