import 'package:flutter/material.dart';
import 'package:flutter_template/app/theme/colors.dart';

ThemeData themeData() {
  final ThemeData base = ThemeData.light();
  final InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    fillColor: Color(0xffECEEF2),
    filled: true,
  );

  return base.copyWith(
    dividerColor: Color(0xFFECEDF1),
    inputDecorationTheme: inputDecorationTheme,
    brightness: Brightness.light,
    backgroundColor: Color(0xFFF2F3F8),
    primaryColor: MainColors.primaryColor,
    accentColor: MainColors.accentColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}