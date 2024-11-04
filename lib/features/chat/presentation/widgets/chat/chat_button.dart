import 'package:chatbot/features/chat/presentation/bloc/message_cubit/message_cubit.dart';
import 'package:chatbot/features/chat/presentation/bloc/message_cubit/message_state.dart';
import 'package:chatbot/util/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatButton extends StatelessWidget {
  const ChatButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MessageCubit, MessageState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: IconButton(
            onPressed: context.watch<MessageCubit>().onPressed(context),
            icon: Icon(
              Icons.send_rounded,
              color: state.message.isEmpty ? context.color.shadow : context.color.secondary,
            ),
          ),
        );
      },
    );
  }
}
