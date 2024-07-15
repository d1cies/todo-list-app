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
                  width: 2,
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
              color: AppColor.lightLabelTertiary,
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
          menuStyle: MenuStyle(
            padding: WidgetStateProperty.all(EdgeInsets.zero),
            backgroundColor: WidgetStateProperty.all(
              AppColor.lightBackElevated,
            ),
          ),
        ),
        extensions: [
          const ThemeColors(
            supportSeparator: AppColor.lightSeparator,
            supportOverlay: AppColor.lightOverlay,
            labelPrimary: AppColor.lightLabelPrimary,
            labelSecondary: AppColor.lightLabelSecondary,
            labelTertiary: AppColor.lightLabelTertiary,
            labelDisable: AppColor.lightDisable,
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

  factory AppTheme.dark() {
    return AppTheme._(
      ThemeData.dark(
        useMaterial3: true,
      ).copyWith(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColor.darkBackPrimary,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColor.darkBackPrimary,
          surfaceTintColor: AppColor.darkBackPrimary,
        ),
        checkboxTheme: CheckboxThemeData(
          side: WidgetStateBorderSide.resolveWith(
            (states) {
              if (!states.contains(WidgetState.selected)) {
                return const BorderSide(
                  width: 2,
                  color: AppColor.darkSeparator,
                );
              }
              return null;
            },
          ),
          fillColor: WidgetStateProperty.resolveWith(
            (states) {
              if (states.contains(WidgetState.selected)) {
                return AppColor.darkGreen;
              }
              return Colors.transparent;
            },
          ),
          checkColor: WidgetStateProperty.resolveWith(
            (states) {
              if (states.contains(WidgetState.selected)) {
                return AppColor.darkBackSecondary;
              }
              return Colors.transparent;
            },
          ),
        ),
        dropdownMenuTheme: DropdownMenuThemeData(
          inputDecorationTheme: InputDecorationTheme(
            labelStyle: AppText.body.copyWith(
              color: AppColor.darkLabelTertiary,
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
          menuStyle: MenuStyle(
            padding: WidgetStateProperty.all(EdgeInsets.zero),
            backgroundColor: WidgetStateProperty.all(
              AppColor.darkBackElevated,
            ),
          ),
        ),
        extensions: [
          const ThemeColors(
            supportSeparator: AppColor.darkSeparator,
            supportOverlay: AppColor.darkOverlay,
            labelPrimary: AppColor.darkLabelPrimary,
            labelSecondary: AppColor.darkLabelSecondary,
            labelTertiary: AppColor.darkLabelTertiary,
            labelDisable: AppColor.darkDisable,
            red: AppColor.darkRed,
            green: AppColor.darkGreen,
            blue: AppColor.darkBlue,
            gray: AppColor.darkGray,
            grayLight: AppColor.darkGrayLight,
            white: AppColor.darkWhite,
            backPrimary: AppColor.darkBackPrimary,
            backSecondary: AppColor.darkBackSecondary,
            backElevated: AppColor.darkBackElevated,
          ),
          ThemeText(
            largeTitle: AppText.largeTitle.copyWith(
              color: AppColor.darkLabelPrimary,
            ),
            title: AppText.title.copyWith(
              color: AppColor.darkLabelPrimary,
            ),
            button: AppText.button.copyWith(
              color: AppColor.darkLabelPrimary,
            ),
            body: AppText.body.copyWith(
              color: AppColor.darkLabelPrimary,
            ),
            subhead: AppText.subhead.copyWith(
              color: AppColor.darkLabelPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
