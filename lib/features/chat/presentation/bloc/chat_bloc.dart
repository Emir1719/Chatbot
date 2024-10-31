import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chatbot/features/chat/data/datasources/chat_service.dart';
import 'package:chatbot/features/chat/data/models/chat_message.dart';
import 'package:chatbot/features/chat/presentation/bloc/conversation/conversation_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  List<ChatMessage>? _chats = [];
  final _service = ChatService();
  int? currentConvId;
  final ConversationBloc conversationBloc;
  final ScrollController scrollController = ScrollController();

  ChatBloc(this.conversationBloc) : super(ChatInitial()) {
    on<UserMessageEvent>(_userMessage);
    on<ChatLoadEvent>(_load);
    on<ChatRestart>(_restart);
  }

  Future<void> _userMessage(UserMessageEvent event, emit) async {
    emit(ChatLoaded(chats: _chats, isLoading: true));

    try {
      // Yeni sohbet başladıysa konuşmayı otomatik oluştur
      if (currentConvId == null) {
        final conv = await _service.createConversation();
        currentConvId = conv.id;

        conversationBloc.add(AddConversationsEvent(convId: conv.id));
      }

      await _service.saveChatByConversationId(currentConvId!, event.message);
      _chats = await _service.getChatsByConvId(currentConvId!);

      emit(ChatLoaded(chats: _chats, isLoading: false));
      // await _scroll();
    } catch (e) {
      emit(ChatError(message: e.toString()));
    }
  }

  Future<void> _load(ChatLoadEvent event, Emitter<ChatState> emit) async {
    emit(const ChatLoaded(chats: [], isLoading: true));

    try {
      currentConvId = event.convId;
      _chats = await _service.getChatsByConvId(event.convId);
      emit(ChatLoaded(chats: _chats, isLoading: false));

      await _scroll();
    } catch (e) {
      emit(ChatError(message: e.toString()));
    }
  }

  FutureOr<void> _restart(ChatRestart event, Emitter<ChatState> emit) {
    emit(ChatInitial());
  }

  _scroll() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (scrollController.hasClients) {
        await scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
        );
      }
    });
  }
}
