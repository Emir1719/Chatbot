import 'package:chatbot/features/chat/presentation/widgets/chat/chat_drawer.dart';
import 'package:chatbot/features/chat/presentation/widgets/chat/chat_list_view_builder.dart';
import 'package:chatbot/features/chat/presentation/widgets/chat/chat_message_area.dart';
import 'package:chatbot/features/chat/presentation/widgets/chat/theme_change_button.dart';
import 'package:chatbot/features/models/domain/extensions/model_extension.dart';
import 'package:chatbot/features/models/presentation/bloc/models_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<ModelsBloc>().model;

    return Scaffold(
      appBar: AppBar(
        title: Text(model?.displayName ?? model?.toName() ?? "Chatbot"),
        actions: [ThemeChangeButton()],
      ),
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
