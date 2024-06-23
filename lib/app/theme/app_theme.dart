import 'package:flutter/material.dart';
import 'package:todo_list/app/theme/constant/app_color.dart';
import 'package:todo_list/app/theme/constant/app_text.dart';
import 'package:todo_list/app/theme/theme_color/theme_colors.dart';
import 'package:todo_list/app/theme/theme_text/theme_text.dart';

class AppTheme {
  final ThemeData themeData;

  AppTheme._(this.themeData);

  factory AppTheme.light() {
    return AppTheme._(
      ThemeData.light(
        useMaterial3: true,
      ).copyWith(
        brightness: Brightness.light,
        scaffoldBackgroundColor: AppColor.lightBackPrimary,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColor.lightBackPrimary,
          surfaceTintColor: AppColor.lightBackPrimary,
        ),
        checkboxTheme: CheckboxThemeData(
          side: WidgetStateBorderSide.resolveWith(
            (states) {
              if (!states.contains(WidgetState.selected)) {
                return const BorderSide(
                  width: 2.0,
                  color: AppColor.lightSeparator,
                );
              }
              return null;
            },
          ),
          fillColor: WidgetStateProperty.resolveWith(
            (states) {
              if (states.contains(WidgetState.selected)) {
                return AppColor.lightGreen;
              }
              return Colors.transparent;
            },
          ),
          checkColor: WidgetStateProperty.resolveWith(
            (states) {
              if (states.contains(WidgetState.selected)) {
                return AppColor.lightWhite;
              }
              return Colors.transparent;
            },
          ),
        ),
        dropdownMenuTheme: DropdownMenuThemeData(
          inputDecorationTheme: InputDecorationTheme(
            labelStyle: AppText.body.copyWith(
              color: AppColor.lightSeparator,
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
            ),
            activeIndicatorBorder: const BorderSide(
              color: Colors.transparent,
            ),
          ),
        ),
        switchTheme: SwitchThemeData(
          // thumbColor: WidgetStateProperty.all(AppColor.lightWhite),
          // overlayColor: WidgetStateProperty.all(AppColor.lightGreen),
          // trackColor: WidgetStateProperty.all(AppColor.lightGreen),
          // trackOutlineColor: WidgetStateProperty.all(AppColor.lightGreen),
        ),
        extensions: [
          const ThemeColors(
            supportSeparator: AppColor.lightSeparator,
            supportOverlay: AppColor.lightOverlay,
            labelPrimary: AppColor.lightLabelPrimary,
            labelSecondary: AppColor.lightLabelSecondary,
            labelTertiary: AppColor.lightLabelTertiary,
            labelDisable: AppColor.lightLabelTertiary,
            red: AppColor.lightRed,
            green: AppColor.lightGreen,
            blue: AppColor.lightBlue,
            gray: AppColor.lightGray,
            grayLight: AppColor.lightGrayLight,
            white: AppColor.lightWhite,
            backPrimary: AppColor.lightBackPrimary,
            backSecondary: AppColor.lightBackSecondary,
            backElevated: AppColor.lightBackElevated,
          ),
          ThemeText(
            largeTitle: AppText.largeTitle.copyWith(
              color: AppColor.lightLabelPrimary,
            ),
            title: AppText.title.copyWith(
              color: AppColor.lightLabelPrimary,
            ),
            button: AppText.button.copyWith(
              color: AppColor.lightLabelPrimary,
            ),
            body: AppText.body.copyWith(
              color: AppColor.lightLabelPrimary,
            ),
            subhead: AppText.subhead.copyWith(
              color: AppColor.lightLabelPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
