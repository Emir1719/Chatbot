// ignore_for_file: use_build_context_synchronously

import 'package:chatbot/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:chatbot/features/chat/presentation/bloc/conversation/conversation_bloc.dart';
import 'package:chatbot/util/app_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class IConvPopup {
  String get name;
  IconData? get icon;
  void onTap(BuildContext context, int convId);
}

class EditPopup extends IConvPopup {
  @override
  String get name => "Düzenle";

  @override
  void onTap(BuildContext context, int convId) async {
    final value = await AppMessage.showInputDialog(context);
    context
        .read<ConversationBloc>()
        .add(EditConversationTitleEvent(convId: convId, title: value ?? "Yeni"));
  }

  @override
  IconData? get icon => Icons.edit;
}

class DeletePopup extends IConvPopup {
  @override
  String get name => "Sil";

  @override
  void onTap(BuildContext context, int convId) {
    context.read<ConversationBloc>().add(DeleteConversationsEvent(convId: convId));
    context.read<ChatBloc>().add(ChatRestart());
  }

  @override
  IconData? get icon => Icons.delete;
}
