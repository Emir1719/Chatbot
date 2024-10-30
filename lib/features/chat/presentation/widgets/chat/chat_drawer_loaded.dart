import 'package:chatbot/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:chatbot/features/chat/presentation/bloc/conversation/conversation_bloc.dart';
import 'package:chatbot/features/chat/presentation/widgets/chat/popup/conversation_popup_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatDrawerLoaded extends StatelessWidget {
  const ChatDrawerLoaded({super.key, required this.state});
  final ConversationLoaded state;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: state.conversations?.length ?? 0,
        itemBuilder: (context, index) {
          var data = state.conversations![index];

          return ListTile(
            onTap: () {
              context.read<ChatBloc>().add(ChatLoadEvent(convId: data.id));
              if (Navigator.canPop(context)) Navigator.pop(context);
            },
            trailing: const ConversationPopupButton(),
            title: Text(data.title),
          );
        },
      ),
    );
  }
}
