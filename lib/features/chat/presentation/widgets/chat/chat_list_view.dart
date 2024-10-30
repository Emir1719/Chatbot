import 'package:chatbot/features/chat/data/models/chat_message.dart';
import 'package:chatbot/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:chatbot/features/chat/presentation/widgets/bubble/bubble_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({super.key, required this.chats, required this.isLoading});
  final List<ChatMessage>? chats;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    return BlocListener<ChatBloc, ChatState>(
      listener: (context, state) => _listener(state, scrollController),
      child: Expanded(
        child: ListView.separated(
          controller: scrollController,
          separatorBuilder: (context, index) => const SizedBox(height: 15),
          itemCount: (chats?.length ?? 0) + (isLoading ? 1 : 0),
          padding: const EdgeInsets.all(15),
          itemBuilder: (context, index) {
            if (index < (chats?.length ?? 0)) {
              return BubbleText(chat: chats?[index]);
            } else if (isLoading) {
              // Yüklenme simgesini sadece son mesajın altına ekler
              return const Center(child: CircularProgressIndicator());
            }
            return Container(); // Diğer durumlar için boş
          },
        ),
      ),
    );
  }

  void _listener(ChatState state, ScrollController scrollController) {
    if (state is ChatLoaded) {
      // Yeni mesaj geldiğinde en alta kaydır
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }
}
