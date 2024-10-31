import 'package:chatbot/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:chatbot/features/chat/presentation/bloc/conversation/conversation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConvAddButton extends StatelessWidget {
  const ConvAddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.read<ConversationBloc>().add(CreateConversationsEvent());
        context.read<ChatBloc>().add(ChatRestart());
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        }
      },
      icon: const Icon(Icons.add_circle_outline_rounded),
    );
  }
}
