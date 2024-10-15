import 'package:chatbot/util/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'Hello World!',
            style: context.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
