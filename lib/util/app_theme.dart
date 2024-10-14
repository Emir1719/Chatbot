import 'package:flutter/material.dart';

final class AppTheme {
  static final _instance = AppTheme._();

  AppTheme._();

  factory AppTheme() => _instance;

  static ThemeData get light => ThemeData(
        textTheme: _textTheme(),
      );

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
    );
  }
}
