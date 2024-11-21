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
        onPrimaryContainer: Colors.grey.shade200,
        error: Colors.red,
        onSecondary: Color(0xff17ce92),
      );

  static ColorScheme get dark => const ColorScheme.dark(
        onPrimary: Colors.black,
        tertiary: Colors.white,
        surface: Color(0xFF121212), // Koyu yüzey rengi
        secondary: Color.fromARGB(255, 147, 221, 255),
        shadow: Colors.grey,
        primaryContainer: Color(0xFF1E1E1E),
        onPrimaryContainer: Color.fromARGB(255, 60, 60, 60),
        error: Color.fromARGB(255, 255, 42, 27),
        onSecondary: Color(0xFF1E1E1E),
      );
}
