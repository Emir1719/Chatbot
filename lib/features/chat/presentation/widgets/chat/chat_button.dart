import 'package:chatbot/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:chatbot/features/chat/presentation/bloc/message_cubit/message_cubit.dart';
import 'package:chatbot/util/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatButton extends StatelessWidget {
  const ChatButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MessageCubit, String>(
      builder: (context, message) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: IconButton(
            onPressed: _onPressed(message, context),
            icon: Icon(
              Icons.send_rounded,
              color: message.isEmpty ? context.color.shadow : context.color.secondary,
            ),
          ),
        );
      },
    );
  }

  void Function()? _onPressed(String message, BuildContext context) {
    return message.isEmpty
        ? null
        : () {
            context.read<ChatBloc>().add(UserMessageEvent(message: message));
            context.read<MessageCubit>().clearMessage();
          };
  }
}
