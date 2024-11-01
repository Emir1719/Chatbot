import 'package:chatbot/features/chat/presentation/bloc/message_cubit/message_cubit.dart';
import 'package:chatbot/features/chat/presentation/widgets/chat/chat_button.dart';
import 'package:chatbot/features/chat/presentation/widgets/chat/chat_camera_send_button.dart';
import 'package:chatbot/util/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatTextForm extends StatelessWidget {
  const ChatTextForm({super.key});

  @override
  Widget build(BuildContext context) {
    final messageCubit = context.read<MessageCubit>();

    return TextFormField(
      controller: messageCubit.controller,
      decoration: const InputDecoration(
        hintText: "message...",
        prefixIcon: ChatCameraSendButton(),
        suffixIcon: ChatButton(),
      ),
      maxLines: 10,
      minLines: 1,
      style: context.text.bodyMedium,
      onChanged: (value) => messageCubit.updateMessage(value),
    );
  }
}
