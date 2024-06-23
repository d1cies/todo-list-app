import 'package:flutter/material.dart';
import 'package:todo_list/app/theme/theme_color/theme_colors.dart';

class DateSwitch extends StatelessWidget {
  final bool enabled;
  final VoidCallback switchDeadline;

  const DateSwitch({
    super.key,
    required this.enabled,
    required this.switchDeadline,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ThemeColors>()!;
    // для старого дизайна Switch
    return Theme(
      data: ThemeData(useMaterial3: false),
      child: Switch(
        value: enabled,
        onChanged: (_) => switchDeadline(),
        activeColor: colors.blue,
        trackColor: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.selected)) {
              return colors.blue.withOpacity(0.3);
            }
            return colors.labelPrimary.withOpacity(0.06);
          },
        ),
      ),
    );
  }
}
