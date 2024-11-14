import 'package:chatbot/features/chat/presentation/widgets/chat/chat_text_form.dart';
import 'package:chatbot/util/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class ChatMessageArea extends StatelessWidget {
  const ChatMessageArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width(),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(color: context.color.primaryContainer),
      child: const ChatTextForm(),
    );
  }
}
