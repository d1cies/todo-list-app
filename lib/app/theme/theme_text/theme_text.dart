import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'theme_text.tailor.dart';

@TailorMixin()
class ThemeText extends ThemeExtension<ThemeText>
    with _$ThemeTextTailorMixin {

  @override
  final TextStyle largeTitle;
  @override
  final TextStyle title;
  @override
  final TextStyle button;
  @override
  final TextStyle body;
  @override
  final TextStyle subhead;

  const ThemeText({
    required this.largeTitle,
    required this.title,
    required this.button,
    required this.body,
    required this.subhead,
  });
}
