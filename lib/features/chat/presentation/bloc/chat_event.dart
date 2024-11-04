part of 'chat_bloc.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class UserMessageEvent extends ChatEvent {
  /// Kullanıcının modele ilettiği mesaj
  final String message;

  const UserMessageEvent({required this.message});

  @override
  List<Object> get props => [message];
}

class UserMessageWithImageEvent extends ChatEvent {
  /// Kullanıcının modele ilettiği mesaj
  final String message;
  final String? imageUrl;

  const UserMessageWithImageEvent({required this.message, required this.imageUrl});

  @override
  List<Object> get props => [message, imageUrl ?? ""];
}

class ChatLoadEvent extends ChatEvent {
  final int convId;

  const ChatLoadEvent({required this.convId});

  @override
  List<Object> get props => [convId];
}

/// Ana ekranı init durumuna döndürür
class ChatRestart extends ChatEvent {}
