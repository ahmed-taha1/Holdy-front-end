import 'package:accounts_protector/core/theming/app_colors.dart';
import 'package:flutter/material.dart';

enum AppTheme {
  light("light"),
  dark("dark");

  const AppTheme(this.value);

  final String value;
}

final appThemeData = {
  AppTheme.light: ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.blackPurple,
    scaffoldBackgroundColor: AppColors.white,
    hintColor: const Color(0xFF697885),
    hoverColor: const Color(0xFFD2F4FF),
    secondaryHeaderColor: const Color(0xFF515A62),
  ),

  AppTheme.dark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.white,
    scaffoldBackgroundColor: const Color(0xFF1F2128),
    hintColor: const Color(0xFFA3A3A3),
    hoverColor: const Color(0xFF38304D),
    secondaryHeaderColor: const Color(0xFFBEBEBE),
  ),
};
