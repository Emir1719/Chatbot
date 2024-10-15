import 'package:chatbot/util/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class ChatTextForm extends StatelessWidget {
  const ChatTextForm({super.key});

  @override
  Widget build(BuildContext context) {
    final message = TextEditingController();

    return Expanded(
      child: TextFormField(
        controller: message,
        decoration: const InputDecoration(
          labelText: "Message",
          hintText: "message...",
        ),
        style: context.textTheme.bodyMedium,
      ),
    );
  }
}
