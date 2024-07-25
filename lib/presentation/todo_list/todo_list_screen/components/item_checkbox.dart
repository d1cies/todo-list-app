import 'package:flutter/material.dart';
import 'package:todo_list/app/theme/theme_color/theme_colors.dart';
import 'package:todo_list/domain/model/importance.dart';
import 'package:todo_list/domain/model/todo.dart';

class ItemCheckbox extends StatelessWidget {
  final Todo todo;
  final ValueSetter<Todo> doneTodo;

  const ItemCheckbox({
    super.key,
    required this.todo,
    required this.doneTodo,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ThemeColors>()!;
    return SizedBox(
      width: 24,
      height: 24,
      child: Checkbox(
        value: todo.done,
        onChanged: (_) => doneTodo(todo),
        side: WidgetStateBorderSide.resolveWith(
          (states) {
            if (!states.contains(WidgetState.selected) &&
                todo.importance == Importance.important) {
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
                todo.importance == Importance.important) {
              return colors.red.withOpacity(0.16);
            }
            if (states.contains(WidgetState.selected)) {
              return colors.green;
            }
            return Colors.transparent;
          },
        ),
      ),
    );
  }
}
