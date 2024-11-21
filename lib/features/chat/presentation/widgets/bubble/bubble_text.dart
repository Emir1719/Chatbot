import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:chatbot/features/chat/data/models/chat.dart';
import 'package:chatbot/features/chat/data/models/sender.dart';
import 'package:chatbot/features/chat/data/repositories/image_parser.dart';
import 'package:chatbot/util/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class BubbleText extends StatelessWidget {
  const BubbleText({super.key, required this.chat});
  final Chat? chat;

  @override
  Widget build(BuildContext context) {
    final isSendUser = chat?.sender == Sender.user;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ImageParser.build(context, chat?.image),
        BubbleSpecialThree(
          text: chat?.message ?? "",
          color: isSendUser ? context.color.onSecondary : context.color.primaryContainer,
          constraints: BoxConstraints(maxWidth: context.width(0.7)),
          tail: true,
          isSender: isSendUser,
          textStyle: context.text.bodyMedium!.copyWith(
            color: isSendUser ? Colors.white : context.color.tertiary,
            height: 1.6,
            overflow: TextOverflow.visible,
          ),
        ),
      ],
    );
  }
}
