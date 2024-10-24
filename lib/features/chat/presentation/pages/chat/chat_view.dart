import 'package:chatbot/features/chat/presentation/widgets/chat/chat_drawer.dart';
import 'package:chatbot/features/chat/presentation/widgets/chat/chat_list_view_builder.dart';
import 'package:chatbot/features/chat/presentation/widgets/chat/chat_message_area.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chatbot")),
      drawer: const ChatDrawer(),
      body: const Column(
        children: [
          ChatListViewBuilder(),
          ChatMessageArea(),
        ],
      ),
    );
  }
}
