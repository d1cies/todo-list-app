import 'package:flutter/material.dart';
import 'package:todo_list/app/theme/theme_color/theme_colors.dart';

class CompleteTitle extends StatelessWidget {
  final int doneTodos;
  final IconData icon;
  final VoidCallback switchShowDone;

  const CompleteTitle({
    super.key,
    required this.doneTodos,
    required this.icon,
    required this.switchShowDone,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ThemeColors>()!;
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        'Выполнено - $doneTodos',
      ),
      trailing: IconButton(
        icon: Icon(
          icon,
          color: colors.blue,
        ),
        onPressed: switchShowDone,
      ),
    );
  }
}
