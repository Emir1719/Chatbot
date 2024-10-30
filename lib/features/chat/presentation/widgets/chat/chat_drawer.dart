import 'package:chatbot/features/chat/presentation/bloc/conversation/conversation_bloc.dart';
import 'package:chatbot/features/chat/presentation/widgets/chat/chat_drawer_loaded.dart';
import 'package:chatbot/features/chat/presentation/widgets/chat/conversation_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatDrawer extends StatelessWidget {
  const ChatDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: BlocBuilder<ConversationBloc, ConversationState>(
          builder: (context, state) {
            if (state is ConversationLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ConversationLoaded) {
              return Column(
                children: [
                  const ConversationTitle(),
                  ChatDrawerLoaded(state: state),
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
