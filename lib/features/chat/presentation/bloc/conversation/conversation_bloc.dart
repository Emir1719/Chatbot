import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chatbot/features/chat/data/datasources/chat_service.dart';
import 'package:chatbot/features/chat/data/models/conversation.dart';
import 'package:equatable/equatable.dart';

part 'conversation_event.dart';
part 'conversation_state.dart';

class ConversationBloc extends Bloc<ConversationEvent, ConversationState> {
  final _service = ChatService();
  List<Conversation>? conversations;

  ConversationBloc() : super(ConversationInitial()) {
    on<LoadConversationsEvent>(_load);
    on<AddConversationsEvent>(_add);
  }

  FutureOr<void> _load(LoadConversationsEvent event, emit) async {
    emit(ConversationLoading());

    try {
      conversations = await _service.getConversations();
      conversations?.sort((a, b) => b.id.compareTo(a.id));
      emit(ConversationLoaded(conversations: conversations));
    } catch (e) {
      emit(ConversationError(message: e.toString()));
    }
  }

  Future<void> _add(AddConversationsEvent event, Emitter<ConversationState> emit) async {
    emit(ConversationLoading());

    try {
      final conv = Conversation(id: event.convId, title: "Yeni");
      conversations?.add(conv);
      conversations?.sort((a, b) => b.id.compareTo(a.id));
      emit(ConversationLoaded(conversations: conversations));
    } catch (e) {
      emit(ConversationError(message: e.toString()));
    }
  }
}
