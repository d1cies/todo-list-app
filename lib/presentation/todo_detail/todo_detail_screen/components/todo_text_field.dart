import 'package:flutter/material.dart';
import 'package:todo_list/app/theme/theme_color/theme_colors.dart';
import 'package:todo_list/generated/app_localizations.dart';

class TodoTextField extends StatelessWidget {
  final TextEditingController textController;
  final FocusNode textFocusNode;

  const TodoTextField({
    super.key,
    required this.textController,
    required this.textFocusNode,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ThemeColors>()!;
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(8),
      elevation: 2,
      child: TextField(
        controller: textController,
        focusNode: textFocusNode,
        maxLines: null,
        onTapOutside: (_) => FocusScope.of(context).unfocus(),
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: AppLocalizations.of(context).hintTodoTextField,
          filled: true,
          fillColor: colors.backSecondary,
          contentPadding: const EdgeInsets.all(16),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
