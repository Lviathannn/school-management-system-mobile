import 'package:flutter/material.dart';
import 'package:school_management_system/shared/themes/app_sizes.dart';
import 'app_colors.dart';
import 'app_texts.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    textTheme: const TextTheme(
      headlineLarge: AppTextStyles.heading,
      headlineMedium: AppTextStyles.subtitle,
      headlineSmall: AppTextStyles.body,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.borderRadius),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
  );
}
