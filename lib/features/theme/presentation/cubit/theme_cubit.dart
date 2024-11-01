import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(mode: ThemeMode.dark));

  void change() {
    final newMode = isDark() ? ThemeMode.light : ThemeMode.dark;
    emit(ThemeState(mode: newMode));
  }

  bool isDark() => state.mode == ThemeMode.dark;
}
