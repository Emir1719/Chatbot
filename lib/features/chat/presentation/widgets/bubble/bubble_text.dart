import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:chatbot/features/chat/data/models/chat.dart';
import 'package:chatbot/features/chat/data/models/sender.dart';
import 'package:chatbot/features/chat/data/repositories/image_parser.dart';
import 'package:chatbot/util/extensions/context_extension.dart';
import 'package:chatbot/util/image.dart';
import 'package:flutter/material.dart';

class BubbleText extends StatelessWidget {
  const BubbleText({super.key, required this.chat});
  final Chat? chat;

  @override
  Widget build(BuildContext context) {
    final isSendUser = chat?.sender == Sender.user;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        isSendUser ? Spacer() : Image.asset(AppImage.chatbot, height: 40),
        Column(
          children: [
            ImageParser.build(chat?.image),
            BubbleSpecialThree(
              text: chat?.message ?? "",
              constraints: BoxConstraints(maxWidth: context.width(0.60)),
              color: context.color.secondary,
              tail: true,
              isSender: isSendUser,
              textStyle: context.text.bodyMedium!.copyWith(
                color: context.color.surface,
                overflow: TextOverflow.fade,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
