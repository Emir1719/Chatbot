import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Singleton deseni uygulanmış tema sınıfı
final class AppTheme {
  static final _instance = AppTheme._();
  AppTheme._();
  factory AppTheme() => _instance;

  static ThemeData theme(ColorScheme colorScheme) {
    final TextTheme textTheme = _textTheme(colorScheme);

    return ThemeData(
      textTheme: textTheme,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.surface,
      drawerTheme: _drawerTheme(colorScheme),
      appBarTheme: _appBarTheme(colorScheme, textTheme),
      inputDecorationTheme: _inputDecorationTheme(colorScheme, textTheme),
      popupMenuTheme: _popupMenuTheme(colorScheme),
    );
  }

  static PopupMenuThemeData _popupMenuTheme(ColorScheme colorScheme) {
    return PopupMenuThemeData(
      color: colorScheme.surface,
    );
  }

  static AppBarTheme _appBarTheme(ColorScheme colorScheme, TextTheme textTheme) {
    final isLight = colorScheme.onPrimary == Colors.white;

    return AppBarTheme(
      backgroundColor: colorScheme.surface,
      titleTextStyle: textTheme.titleLarge,
      surfaceTintColor: colorScheme.surface,
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: colorScheme.surface,
        systemNavigationBarColor: colorScheme.primaryContainer,
        systemNavigationBarIconBrightness: isLight ? Brightness.dark : Brightness.light,
        statusBarIconBrightness: isLight ? Brightness.dark : Brightness.light,
      ),
    );
  }

  static DrawerThemeData _drawerTheme(ColorScheme colorScheme) {
    return DrawerThemeData(
      backgroundColor: colorScheme.surface,
      surfaceTintColor: colorScheme.surface,
    );
  }

  static InputDecorationTheme _inputDecorationTheme(ColorScheme colorScheme, TextTheme textTheme) {
    const border = OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.all(Radius.circular(10)),
    );

    return InputDecorationTheme(
      border: border,
      disabledBorder: border,
      fillColor: colorScheme.surface,
      filled: true,
      outlineBorder: BorderSide.none,
      hintStyle: textTheme.bodyMedium,
      focusedBorder: border,
      enabledBorder: border,
      errorBorder: border,
      labelStyle: textTheme.bodyLarge,
    );
  }

  static TextTheme _textTheme(ColorScheme colorScheme) {
    final base = TextStyle(
      fontSize: 16,
      overflow: TextOverflow.ellipsis,
      color: colorScheme.tertiary,
    );

    return TextTheme(
      bodyLarge: base.copyWith(fontSize: 18, fontWeight: FontWeight.w500),
      bodyMedium: base,
      bodySmall: base.copyWith(fontSize: 14),
      titleLarge: base.copyWith(fontSize: 20, fontWeight: FontWeight.w500),
    );
  }
}
