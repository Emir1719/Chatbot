import 'package:chatbot/features/chat/presentation/bloc/message_cubit/message_cubit.dart';
import 'package:chatbot/util/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatTextForm extends StatelessWidget {
  const ChatTextForm({super.key});

  @override
  Widget build(BuildContext context) {
    final messageCubit = context.read<MessageCubit>();

    return Expanded(
      child: TextFormField(
        controller: messageCubit.controller,
        decoration: const InputDecoration(
          labelText: "Message",
          hintText: "message...",
        ),
        maxLength: 300,
        style: context.textTheme.bodyMedium,
        onChanged: (value) => messageCubit.updateMessage(value),
      ),
    );
  }
}
