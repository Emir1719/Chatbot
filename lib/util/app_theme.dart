import 'package:flutter/material.dart';

final class AppTheme {
  static final _instance = AppTheme._();

  AppTheme._();

  factory AppTheme() => _instance;

  static ThemeData get light => ThemeData(
        textTheme: _textTheme(),
        scaffoldBackgroundColor: Colors.white,
        drawerTheme: const DrawerThemeData(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: _textTheme().titleLarge,
          centerTitle: true,
        ),
        primaryColor: Colors.deepOrange,
        inputDecorationTheme: _inputDecorationTheme(),
      );

  static InputDecorationTheme _inputDecorationTheme() {
    const border = OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.all(Radius.circular(10)),
    );

    return InputDecorationTheme(
      border: border,
      fillColor: Colors.white,
      filled: true,
      hintStyle: _textTheme().bodyMedium,
      focusedBorder: border,
      enabledBorder: border,
      labelStyle: _textTheme().bodyLarge,
    );
  }

  static TextTheme _textTheme() {
    const base = TextStyle(
      fontSize: 16,
      overflow: TextOverflow.ellipsis,
      color: Colors.black,
    );

    return TextTheme(
      bodyLarge: base.copyWith(fontSize: 18),
      bodyMedium: base,
      bodySmall: base.copyWith(fontSize: 14),
      titleLarge: base.copyWith(fontSize: 20, fontWeight: FontWeight.w500),
    );
  }
}
