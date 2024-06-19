import 'package:flutter/material.dart';
import 'package:todo_list/app/theme/constant/app_color.dart';
import 'package:todo_list/app/theme/theme_colors.dart';

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
        ],
      ),
    );
  }
}
