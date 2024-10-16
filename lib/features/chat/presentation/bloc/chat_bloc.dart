import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chatbot/features/chat/data/datasources/gemini_service.dart';
import 'package:chatbot/features/chat/data/models/chat.dart';
import 'package:chatbot/features/chat/data/models/sender.dart';
import 'package:equatable/equatable.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final _model = GeminiService();
  final List<Chat> _chats = [];

  ChatBloc() : super(ChatInitial()) {
    on<UserMessageEvent>(_userMessage);
  }

  Future<void> _userMessage(UserMessageEvent event, emit) async {
    //emit(ChatLoading());
    emit(ChatLoaded(chats: _chats, isLoading: true));

    try {
      // Kullanıcının mesajı modele aktarılır
      final userChat = Chat(sender: Sender.user, message: event.message.trim());
      _chats.add(userChat);

      // Chatbot'un mesajı modele aktarılır
      final response = await _model.message(userChat.message);
      final chat = Chat(sender: Sender.model, message: response ?? "Hata");
      _chats.add(chat);

      emit(ChatLoaded(chats: _chats, isLoading: false));
    } catch (e) {
      print("hata: $e");
      emit(ChatError(message: e.toString()));
    }
  }
}
