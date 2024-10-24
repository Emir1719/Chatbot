import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chatbot/features/chat/data/datasources/chat_service.dart';
import 'package:chatbot/features/chat/data/models/conversation.dart';
import 'package:equatable/equatable.dart';

part 'conversation_event.dart';
part 'conversation_state.dart';

class ConversationBloc extends Bloc<ConversationEvent, ConversationState> {
  final _service = ChatService();

  ConversationBloc() : super(ConversationInitial()) {
    on<LoadConversationsEvent>(_load);
  }

  FutureOr<void> _load(LoadConversationsEvent event, emit) async {
    emit(ConversationLoading());

    try {
      final conv = await _service.getConversations();
      emit(ConversationLoaded(conversations: conv));
    } catch (e) {
      emit(ConversationError(message: e.toString()));
    }
  }
}
