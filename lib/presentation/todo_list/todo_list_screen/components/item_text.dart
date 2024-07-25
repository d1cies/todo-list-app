import 'package:flutter/material.dart';
import 'package:todo_list/app/theme/theme_color/theme_colors.dart';
import 'package:todo_list/app/theme/theme_text/theme_text.dart';
import 'package:todo_list/domain/model/importance.dart';
import 'package:todo_list/domain/model/todo.dart';
import 'package:todo_list/extensions/date_format.dart';

class ItemText extends StatelessWidget {
  final Todo todo;

  const ItemText({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ThemeColors>()!;
    final text = Theme.of(context).extension<ThemeText>()!;
    final deadline = todo.deadline;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            text: todo.importance == Importance.important ? '!! ' : '',
            style: text.body.copyWith(
              color: colors.red,
            ),
            children: [
              TextSpan(
                text: todo.text,
                style: text.body.copyWith(
                  decoration: todo.done ? TextDecoration.lineThrough : null,
                  decorationColor: colors.supportSeparator,
                  color: todo.done ? colors.supportSeparator : null,
                ),
              ),
            ],
          ),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        if (deadline != null)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              deadline.fromDateToString(context),
              style: text.subhead.copyWith(
                color: colors.supportSeparator,
              ),
            ),
          ),
      ],
    );
  }
}
