import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:chatbot/features/chat/data/models/chat_message.dart';
import 'package:chatbot/util/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class BubbleText extends StatelessWidget {
  const BubbleText({super.key, required this.chat});
  final ChatMessage? chat;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BubbleSpecialThree(
          text: chat?.userMessage ?? "",
          color: const Color(0xFF1B97F3),
          tail: true,
          isSender: true,
          textStyle: context.text.bodyMedium!.copyWith(
            color: context.color.surface,
            overflow: TextOverflow.fade,
          ),
        ),
        const SizedBox(height: 10),
        BubbleSpecialThree(
          text: chat?.modelMessage ?? "",
          color: const Color(0xFF1B97F3),
          tail: true,
          isSender: false,
          textStyle: context.text.bodyMedium!.copyWith(
            color: context.color.surface,
            overflow: TextOverflow.fade,
          ),
        ),
      ],
    );
  }
}
