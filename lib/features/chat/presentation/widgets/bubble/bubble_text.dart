import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:chatbot/features/chat/data/models/chat.dart';
import 'package:chatbot/features/chat/data/models/sender.dart';
import 'package:chatbot/features/chat/data/repositories/image_parser.dart';
import 'package:chatbot/features/models/domain/extensions/model_extension.dart';
import 'package:chatbot/features/models/presentation/bloc/models_bloc.dart';
import 'package:chatbot/util/extensions/context_extension.dart';
import 'package:chatbot/util/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BubbleText extends StatelessWidget {
  const BubbleText({super.key, required this.chat});
  final Chat? chat;

  @override
  Widget build(BuildContext context) {
    final isSendUser = chat?.sender == Sender.user;
    final model = context.read<ModelsBloc>().model;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        isSendUser
            ? Spacer()
            : Image.asset(model?.toPath() ?? AppImage.technologyExpert, height: 40),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ImageParser.build(context, chat?.image),
            BubbleSpecialThree(
              text: chat?.message ?? "",
              color: context.color.secondary,
              constraints: BoxConstraints(maxWidth: context.width(0.65)),
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
