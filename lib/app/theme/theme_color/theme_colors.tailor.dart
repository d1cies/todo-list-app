// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'theme_colors.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$ThemeColorsTailorMixin on ThemeExtension<ThemeColors> {
  Color get supportSeparator;
  Color get supportOverlay;
  Color get labelPrimary;
  Color get labelSecondary;
  Color get labelTertiary;
  Color get labelDisable;
  Color get red;
  Color get green;
  Color get blue;
  Color get gray;
  Color get grayLight;
  Color get white;
  Color get backPrimary;
  Color get backSecondary;
  Color get backElevated;

  @override
  ThemeColors copyWith({
    Color? supportSeparator,
    Color? supportOverlay,
    Color? labelPrimary,
    Color? labelSecondary,
    Color? labelTertiary,
    Color? labelDisable,
    Color? red,
    Color? green,
    Color? blue,
    Color? gray,
    Color? grayLight,
    Color? white,
    Color? backPrimary,
    Color? backSecondary,
    Color? backElevated,
  }) {
    return ThemeColors(
      supportSeparator: supportSeparator ?? this.supportSeparator,
      supportOverlay: supportOverlay ?? this.supportOverlay,
      labelPrimary: labelPrimary ?? this.labelPrimary,
      labelSecondary: labelSecondary ?? this.labelSecondary,
      labelTertiary: labelTertiary ?? this.labelTertiary,
      labelDisable: labelDisable ?? this.labelDisable,
      red: red ?? this.red,
      green: green ?? this.green,
      blue: blue ?? this.blue,
      gray: gray ?? this.gray,
      grayLight: grayLight ?? this.grayLight,
      white: white ?? this.white,
      backPrimary: backPrimary ?? this.backPrimary,
      backSecondary: backSecondary ?? this.backSecondary,
      backElevated: backElevated ?? this.backElevated,
    );
  }

  @override
  ThemeColors lerp(covariant ThemeExtension<ThemeColors>? other, double t) {
    if (other is! ThemeColors) return this as ThemeColors;
    return ThemeColors(
      supportSeparator:
          Color.lerp(supportSeparator, other.supportSeparator, t)!,
      supportOverlay: Color.lerp(supportOverlay, other.supportOverlay, t)!,
      labelPrimary: Color.lerp(labelPrimary, other.labelPrimary, t)!,
      labelSecondary: Color.lerp(labelSecondary, other.labelSecondary, t)!,
      labelTertiary: Color.lerp(labelTertiary, other.labelTertiary, t)!,
      labelDisable: Color.lerp(labelDisable, other.labelDisable, t)!,
      red: Color.lerp(red, other.red, t)!,
      green: Color.lerp(green, other.green, t)!,
      blue: Color.lerp(blue, other.blue, t)!,
      gray: Color.lerp(gray, other.gray, t)!,
      grayLight: Color.lerp(grayLight, other.grayLight, t)!,
      white: Color.lerp(white, other.white, t)!,
      backPrimary: Color.lerp(backPrimary, other.backPrimary, t)!,
      backSecondary: Color.lerp(backSecondary, other.backSecondary, t)!,
      backElevated: Color.lerp(backElevated, other.backElevated, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ThemeColors &&
            const DeepCollectionEquality()
                .equals(supportSeparator, other.supportSeparator) &&
            const DeepCollectionEquality()
                .equals(supportOverlay, other.supportOverlay) &&
            const DeepCollectionEquality()
                .equals(labelPrimary, other.labelPrimary) &&
            const DeepCollectionEquality()
                .equals(labelSecondary, other.labelSecondary) &&
            const DeepCollectionEquality()
                .equals(labelTertiary, other.labelTertiary) &&
            const DeepCollectionEquality()
                .equals(labelDisable, other.labelDisable) &&
            const DeepCollectionEquality().equals(red, other.red) &&
            const DeepCollectionEquality().equals(green, other.green) &&
            const DeepCollectionEquality().equals(blue, other.blue) &&
            const DeepCollectionEquality().equals(gray, other.gray) &&
            const DeepCollectionEquality().equals(grayLight, other.grayLight) &&
            const DeepCollectionEquality().equals(white, other.white) &&
            const DeepCollectionEquality()
                .equals(backPrimary, other.backPrimary) &&
            const DeepCollectionEquality()
                .equals(backSecondary, other.backSecondary) &&
            const DeepCollectionEquality()
                .equals(backElevated, other.backElevated));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(supportSeparator),
      const DeepCollectionEquality().hash(supportOverlay),
      const DeepCollectionEquality().hash(labelPrimary),
      const DeepCollectionEquality().hash(labelSecondary),
      const DeepCollectionEquality().hash(labelTertiary),
      const DeepCollectionEquality().hash(labelDisable),
      const DeepCollectionEquality().hash(red),
      const DeepCollectionEquality().hash(green),
      const DeepCollectionEquality().hash(blue),
      const DeepCollectionEquality().hash(gray),
      const DeepCollectionEquality().hash(grayLight),
      const DeepCollectionEquality().hash(white),
      const DeepCollectionEquality().hash(backPrimary),
      const DeepCollectionEquality().hash(backSecondary),
      const DeepCollectionEquality().hash(backElevated),
    );
  }
}

extension ThemeColorsBuildContextProps on BuildContext {
  ThemeColors get themeColors => Theme.of(this).extension<ThemeColors>()!;
  Color get supportSeparator => themeColors.supportSeparator;
  Color get supportOverlay => themeColors.supportOverlay;
  Color get labelPrimary => themeColors.labelPrimary;
  Color get labelSecondary => themeColors.labelSecondary;
  Color get labelTertiary => themeColors.labelTertiary;
  Color get labelDisable => themeColors.labelDisable;
  Color get red => themeColors.red;
  Color get green => themeColors.green;
  Color get blue => themeColors.blue;
  Color get gray => themeColors.gray;
  Color get grayLight => themeColors.grayLight;
  Color get white => themeColors.white;
  Color get backPrimary => themeColors.backPrimary;
  Color get backSecondary => themeColors.backSecondary;
  Color get backElevated => themeColors.backElevated;
}
