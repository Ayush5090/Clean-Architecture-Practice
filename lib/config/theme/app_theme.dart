import 'package:blog_app/core/resources/pallet.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static _border([Color color = AppPallet.borderColor]) => OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(15),
      );
  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppPallet.backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppPallet.backgroundColor,
    ),
    chipTheme: const ChipThemeData(
      color: WidgetStatePropertyAll(
        AppPallet.backgroundColor,
      ),
      side: BorderSide.none,
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      border: _border(),
      enabledBorder: _border(),
      focusedBorder: _border(AppPallet.gradient2),
      errorBorder: _border(AppPallet.errorColor),
    ),
  );
}
