import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_list/app/theme/theme_color/theme_colors.dart';
import 'package:todo_list/app/theme/theme_text/theme_text.dart';
import 'package:todo_list/generated/app_localizations.dart';

class DeleteElement extends StatelessWidget {
  final bool isNewTodo;
  final String? id;
  final ValueSetter<String?> deleteTodo;

  const DeleteElement({
    super.key,
    required this.isNewTodo,
    required this.deleteTodo,
    this.id,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ThemeColors>()!;
    final text = Theme.of(context).extension<ThemeText>()!;
    final localizations = AppLocalizations.of(context);
    return IgnorePointer(
      ignoring: isNewTodo,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: InkWell(
          onTap: () => deleteTodo(id),
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/svg/trash.svg',
                colorFilter: ColorFilter.mode(
                  isNewTodo ? colors.labelDisable : colors.red,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                localizations.delete,
                style: text.body.copyWith(
                  color: isNewTodo ? colors.labelDisable : colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
