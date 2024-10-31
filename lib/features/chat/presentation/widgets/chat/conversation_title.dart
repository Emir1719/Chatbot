import 'package:chatbot/features/chat/presentation/bloc/conversation/conversation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConversationTitle extends StatelessWidget {
  const ConversationTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Konuşmalar",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          ),
          IconButton(
            onPressed: () {
              context.read<ConversationBloc>().add(CreateConversationsEvent());
            },
            icon: const Icon(Icons.add_circle_outline_rounded),
          ),
        ],
      ),
    );
  }
}
