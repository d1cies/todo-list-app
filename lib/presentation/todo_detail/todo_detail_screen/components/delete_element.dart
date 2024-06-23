import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_list/app/theme/theme_color/theme_colors.dart';
import 'package:todo_list/app/theme/theme_text/theme_text.dart';

class DeleteElement extends StatelessWidget {
  final bool isNewTodo;
  final String? id;
  final ValueSetter<String?> deleteTodo;

  const DeleteElement({
    super.key,
    required this.isNewTodo,
    this.id,
    required this.deleteTodo,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ThemeColors>()!;
    final text = Theme.of(context).extension<ThemeText>()!;
    return IgnorePointer(
      ignoring: isNewTodo,
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: InkWell(
          onTap: () => deleteTodo(id),
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/svg/trash.svg',
                colorFilter: ColorFilter.mode(
                  isNewTodo
                      ? colors.labelPrimary.withOpacity(0.15)
                      : colors.red,
                  BlendMode.modulate,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'Удалить',
                style: text.body.copyWith(
                  color: isNewTodo
                      ? colors.labelPrimary.withOpacity(0.15)
                      : colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
