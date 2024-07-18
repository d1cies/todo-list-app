import 'package:flutter/material.dart';
import 'package:todo_list/app/theme/theme_color/theme_colors.dart';
import 'package:todo_list/app/theme/theme_text/theme_text.dart';
import 'package:todo_list/domain/model/importance.dart';
import 'package:todo_list/presentation/todo_detail/todo_detail_screen/todo_detail_screen_wm.dart';

class SelectImportance extends StatelessWidget {
  final ITodoDetailScreenWidgetModel wm;

  const SelectImportance({super.key, required this.wm});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ThemeColors>()!;
    final text = Theme.of(context).extension<ThemeText>()!;
    return ButtonTheme(
      padding: EdgeInsets.zero,
      alignedDropdown: true,
      child: DropdownMenu<Importance>(
        trailingIcon: const SizedBox.shrink(),
        selectedTrailingIcon: const SizedBox.shrink(),
        initialSelection: wm.selectedImportanceController.value,
        textStyle:
            text.subhead.copyWith(color: colors.labelPrimary.withOpacity(0.3)),
        inputDecorationTheme: const InputDecorationTheme(
          activeIndicatorBorder: BorderSide(
            color: Colors.transparent,
          ),
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
        menuStyle: MenuStyle(
          padding: WidgetStateProperty.all(EdgeInsets.zero),
          backgroundColor: WidgetStateProperty.all(wm.color.white),
        ),
        onSelected: (cur) => wm.selectImportance(cur ?? Importance.basic),
        dropdownMenuEntries:
            wm.importanceMap.entries.map<DropdownMenuEntry<Importance>>(
          (importance) {
            final color = importance.key == Importance.important
                ? colors.red
                : colors.labelPrimary;
            return DropdownMenuEntry<Importance>(
              value: importance.key,
              label: importance.value,
              style: ButtonStyle(
                foregroundColor: WidgetStateProperty.all(color),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
