import 'package:bloc/bloc.dart';
import 'package:chatbot/features/theme/data/theme_storage.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final ThemeStorage _themeStorage;

  ThemeCubit(this._themeStorage)
      : super(
          ThemeState(mode: _themeStorage.getThemeMode() ? ThemeMode.light : ThemeMode.dark),
        );

  void change() {
    final newMode = isDark() ? ThemeMode.light : ThemeMode.dark;
    _themeStorage.setThemeMode(isDark());
    emit(ThemeState(mode: newMode));
  }

  bool isDark() => state.mode == ThemeMode.dark;
}
