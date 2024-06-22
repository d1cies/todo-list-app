// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'theme_text.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$ThemeTextTailorMixin on ThemeExtension<ThemeText> {
  TextStyle get largeTitle;
  TextStyle get title;
  TextStyle get button;
  TextStyle get body;
  TextStyle get subhead;

  @override
  ThemeText copyWith({
    TextStyle? largeTitle,
    TextStyle? title,
    TextStyle? button,
    TextStyle? body,
    TextStyle? subhead,
  }) {
    return ThemeText(
      largeTitle: largeTitle ?? this.largeTitle,
      title: title ?? this.title,
      button: button ?? this.button,
      body: body ?? this.body,
      subhead: subhead ?? this.subhead,
    );
  }

  @override
  ThemeText lerp(covariant ThemeExtension<ThemeText>? other, double t) {
    if (other is! ThemeText) return this as ThemeText;
    return ThemeText(
      largeTitle: TextStyle.lerp(largeTitle, other.largeTitle, t)!,
      title: TextStyle.lerp(title, other.title, t)!,
      button: TextStyle.lerp(button, other.button, t)!,
      body: TextStyle.lerp(body, other.body, t)!,
      subhead: TextStyle.lerp(subhead, other.subhead, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ThemeText &&
            const DeepCollectionEquality()
                .equals(largeTitle, other.largeTitle) &&
            const DeepCollectionEquality().equals(title, other.title) &&
            const DeepCollectionEquality().equals(button, other.button) &&
            const DeepCollectionEquality().equals(body, other.body) &&
            const DeepCollectionEquality().equals(subhead, other.subhead));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(largeTitle),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(button),
      const DeepCollectionEquality().hash(body),
      const DeepCollectionEquality().hash(subhead),
    );
  }
}

extension ThemeTextBuildContextProps on BuildContext {
  ThemeText get themeText => Theme.of(this).extension<ThemeText>()!;
  TextStyle get largeTitle => themeText.largeTitle;
  TextStyle get title => themeText.title;
  TextStyle get button => themeText.button;
  TextStyle get body => themeText.body;
  TextStyle get subhead => themeText.subhead;
}
