import 'package:chatbot/features/chat/data/models/chat.dart';
import 'package:chatbot/features/chat/presentation/widgets/bubble/bubble_text.dart';
import 'package:flutter/material.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({super.key, required this.chats, required this.isLoading});
  final List<Chat> chats;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(height: 15),
        itemCount: chats.length + (isLoading ? 1 : 0),
        padding: const EdgeInsets.all(15),
        itemBuilder: (context, index) {
          if (index < chats.length) {
            return BubbleText(chat: chats[index]);
          } else if (isLoading) {
            // Yüklenme simgesini sadece son mesajın altına ekler
            return const Center(child: CircularProgressIndicator());
          }
          return Container(); // Diğer durumlar için boş
        },
      ),
    );
  }
}
