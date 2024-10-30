import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chatbot/features/chat/data/datasources/chat_service.dart';
import 'package:chatbot/features/chat/data/models/chat_message.dart';
import 'package:chatbot/features/chat/presentation/bloc/conversation/conversation_bloc.dart';
import 'package:equatable/equatable.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  List<ChatMessage>? _chats = [];
  final _service = ChatService();
  int? currentConvId;
  final ConversationBloc conversationBloc;

  ChatBloc(this.conversationBloc) : super(ChatInitial()) {
    on<UserMessageEvent>(_userMessage);
    on<ChatLoadEvent>(_load);
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
    } catch (e) {
      emit(ChatError(message: e.toString()));
    }
  }
}
