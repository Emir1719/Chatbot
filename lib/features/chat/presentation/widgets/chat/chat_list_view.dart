import 'package:chatbot/features/chat/data/models/chat.dart';
import 'package:chatbot/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:chatbot/features/chat/presentation/widgets/bubble/bubble_text.dart';
import 'package:chatbot/features/chat/presentation/widgets/common/app_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({super.key, required this.chats, required this.isLoading});
  final List<Chat>? chats;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: context.read<ChatBloc>().scrollController,
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemCount: (chats?.length ?? 0) + (isLoading ? 1 : 0),
      padding: const EdgeInsets.all(10),
      itemBuilder: (context, index) {
        if (index < (chats?.length ?? 0)) {
          return BubbleText(chat: chats?[index]);
        } else if (isLoading) {
          // Yüklenme simgesini sadece son mesajın altına ekler
          return AppLoading();
        }
        return Container(); // Diğer durumlar için boş
      },
    );
  }
}
