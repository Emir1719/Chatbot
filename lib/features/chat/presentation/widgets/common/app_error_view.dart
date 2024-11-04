import 'package:chatbot/util/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class AppErrorView extends StatelessWidget {
  const AppErrorView({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        message,
        style: context.text.bodyLarge?.copyWith(color: context.color.error),
        maxLines: 15,
      ),
    );
  }
}
