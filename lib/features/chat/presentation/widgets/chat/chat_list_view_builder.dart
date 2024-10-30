import 'package:chatbot/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:chatbot/features/chat/presentation/widgets/chat/chat_list_view.dart';
import 'package:chatbot/features/chat/presentation/widgets/chat/chatbot_greeting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatListViewBuilder extends StatelessWidget {
  const ChatListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ChatBloc, ChatState>(
        builder: (context, state) {
          if (state is ChatLoaded) {
            return ChatListView(chats: state.chats, isLoading: state.isLoading);
          } else if (state is ChatInitial) {
            return const ChatbotGreeting();
          }
          return const SizedBox();
        },
      ),
    );
  }
}
