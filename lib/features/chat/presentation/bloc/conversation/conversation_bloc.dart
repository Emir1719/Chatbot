import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chatbot/config/service_locator.dart';
import 'package:chatbot/features/chat/data/datasources/chat_service.dart';
import 'package:chatbot/features/chat/data/models/conversation.dart';
import 'package:chatbot/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:equatable/equatable.dart';

part 'conversation_event.dart';
part 'conversation_state.dart';

class ConversationBloc extends Bloc<ConversationEvent, ConversationState> {
  final _service = getIt<ChatService>();
  List<Conversation>? conversations;

  ConversationBloc() : super(ConversationInitial()) {
    on<LoadConversationsEvent>(_load);
    on<AddConversationsEvent>(_add);
    on<DeleteConversationsEvent>(_delete);
    on<CreateConversationsEvent>(_create);
    on<EditConversationTitleEvent>(_edit);
  }

  FutureOr<void> _load(LoadConversationsEvent event, emit) async {
    emit(ConversationLoading());

    try {
      conversations = await _service.getConversations();
      _sort();

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
      _sort();
      emit(ConversationLoaded(conversations: conversations));
    } catch (e) {
      emit(ConversationError(message: e.toString()));
    }
  }

  void _sort() => conversations?.sort((a, b) => b.id.compareTo(a.id));

  FutureOr<void> _delete(DeleteConversationsEvent event, Emitter<ConversationState> emit) async {
    emit(ConversationLoading());

    try {
      await _service.deleteConversationById(event.convId);
      conversations?.remove(conversations?.firstWhere((element) => element.id == event.convId));
      emit(ConversationLoaded(conversations: conversations));
    } catch (e) {
      emit(ConversationError(message: e.toString()));
    }
  }

  FutureOr<void> _create(CreateConversationsEvent event, Emitter<ConversationState> emit) async {
    emit(ConversationLoading());

    try {
      final conv = await _service.createConversation();
      conversations?.add(conv);
      getIt<ChatBloc>().changeConvId(conv.id);
      _sort();

      emit(ConversationLoaded(conversations: conversations));
    } catch (e) {
      emit(ConversationError(message: e.toString()));
    }
  }

  FutureOr<void> _edit(EditConversationTitleEvent event, Emitter<ConversationState> emit) async {
    emit(ConversationLoading());

    try {
      await _service.updateConversationById(event.convId, event.title);
      conversations?.firstWhere((element) => element.id == event.convId).title = event.title;
      _sort();

      emit(ConversationLoaded(conversations: conversations));
    } catch (e) {
      emit(ConversationError(message: e.toString()));
    }
  }
}
