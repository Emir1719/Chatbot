import 'package:flutter/material.dart';

/// Singleton deseni uygulanmış renk sınıfı
final class AppColorScheme {
  static final _instance = AppColorScheme._();
  AppColorScheme._();
  factory AppColorScheme() => _instance;

  static ColorScheme get light => ColorScheme.light(
        onPrimary: Colors.white,
        tertiary: Colors.black,
        surface: Colors.white,
        secondary: Colors.blue,
        shadow: Colors.grey,
        primaryContainer: Colors.grey.shade100,
        error: Colors.red,
      );

  static ColorScheme get dark => const ColorScheme.dark(
        onPrimary: Colors.black,
        tertiary: Colors.white,
        surface: Color(0xFF121212), // Koyu yüzey rengi
        secondary: Color.fromARGB(255, 147, 221, 255),
        shadow: Colors.grey,
        primaryContainer: Color(0xFF1E1E1E),
        error: Color.fromARGB(255, 255, 42, 27),
      );
}
