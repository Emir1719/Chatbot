part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  final ThemeMode mode;

  const ThemeState({required this.mode});

  @override
  List<Object> get props => [mode];
}
