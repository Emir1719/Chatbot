import 'package:chatbot/features/chat/presentation/bloc/conversation/conversation_bloc.dart';
import 'package:flutter/material.dart';

class ChatDrawerLoaded extends StatelessWidget {
  const ChatDrawerLoaded({super.key, required this.state});
  final ConversationLoaded state;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: state.conversations?.length ?? 0,
      itemBuilder: (context, index) {
        var data = state.conversations![index];

        return ListTile(
          onTap: () {
            print(data.id);
          },
          title: Text(data.title),
        );
      },
    );
  }
}
