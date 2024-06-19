import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'theme_colors.tailor.dart';

@TailorMixin()
class ThemeColors extends ThemeExtension<ThemeColors>
    with _$ThemeColorsTailorMixin {
  @override
  final Color supportSeparator;
  @override
  final Color supportOverlay;

  @override
  final Color labelPrimary;
  @override
  final Color labelSecondary;
  @override
  final Color labelTertiary;
  @override
  final Color labelDisable;

  @override
  final Color red;
  @override
  final Color green;
  @override
  final Color blue;
  @override
  final Color gray;
  @override
  final Color grayLight;
  @override
  final Color white;

  @override
  final Color backPrimary;
  @override
  final Color backSecondary;
  @override
  final Color backElevated;

  const ThemeColors({
    required this.supportSeparator,
    required this.supportOverlay,
    required this.labelPrimary,
    required this.labelSecondary,
    required this.labelTertiary,
    required this.labelDisable,
    required this.red,
    required this.green,
    required this.blue,
    required this.gray,
    required this.grayLight,
    required this.white,
    required this.backPrimary,
    required this.backSecondary,
    required this.backElevated,
  });
}
