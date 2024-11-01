import 'package:chatbot/features/theme/presentation/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeChangeButton extends StatelessWidget {
  const ThemeChangeButton({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.watch<ThemeCubit>();

    return IconButton(
      onPressed: () => themeCubit.change(),
      icon: themeCubit.isDark() ? Icon(Icons.light_mode) : Icon(Icons.dark_mode),
    );
  }
}
