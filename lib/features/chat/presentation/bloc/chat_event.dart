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
}
