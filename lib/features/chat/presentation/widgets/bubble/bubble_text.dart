import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:chatbot/features/chat/data/models/chat.dart';
import 'package:chatbot/features/chat/data/models/sender.dart';
import 'package:chatbot/util/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class BubbleText extends StatelessWidget {
  const BubbleText({super.key, required this.chat});
  final Chat chat;

  @override
  Widget build(BuildContext context) {
    return BubbleSpecialThree(
      text: chat.message,
      color: const Color(0xFF1B97F3),
      tail: true,
      isSender: chat.sender == Sender.user,
      textStyle: context.textTheme.bodyMedium!.copyWith(
        color: Colors.white,
        overflow: TextOverflow.fade,
      ),
    );
  }
}
