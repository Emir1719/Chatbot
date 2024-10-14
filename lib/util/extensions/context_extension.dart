import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  // theme
  TextTheme get textTheme => Theme.of(this).textTheme;

  // size
  Size get size => MediaQuery.of(this).size;
  double height([double scale = 1]) => size.height * scale;
  double width([double scale = 1]) => size.width * scale;
}
