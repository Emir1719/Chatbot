import 'package:flutter/material.dart';

final class AppTheme {
  static final _instance = AppTheme._();

  AppTheme._();

  factory AppTheme() => _instance;

  static ThemeData get light => ThemeData(
        textTheme: _textTheme(),
        colorScheme: _colorScheme(),
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
        inputDecorationTheme: _inputDecorationTheme(),
        popupMenuTheme: const PopupMenuThemeData(
          color: Colors.white,
        ),
      );

  static ColorScheme _colorScheme() {
    return const ColorScheme.light(
      onPrimary: Colors.white,
      tertiary: Colors.black,
      surface: Colors.white,
      secondary: Colors.blue,
    );
  }

  static InputDecorationTheme _inputDecorationTheme() {
    const border = OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.all(Radius.circular(10)),
    );

    return InputDecorationTheme(
      border: border,
      disabledBorder: border,
      fillColor: Colors.white,
      filled: true,
      outlineBorder: BorderSide.none,
      hintStyle: _textTheme().bodyMedium,
      focusedBorder: border,
      enabledBorder: border,
      errorBorder: border,
      labelStyle: _textTheme().bodyLarge,
    );
  }

  static TextTheme _textTheme() {
    final base = TextStyle(
      fontSize: 16,
      overflow: TextOverflow.ellipsis,
      color: _colorScheme().tertiary,
    );

    return TextTheme(
      bodyLarge: base.copyWith(fontSize: 18),
      bodyMedium: base,
      bodySmall: base.copyWith(fontSize: 14),
      titleLarge: base.copyWith(fontSize: 20, fontWeight: FontWeight.w500),
    );
  }
}
