part of 'conversation_bloc.dart';

sealed class ConversationEvent extends Equatable {
  const ConversationEvent();

  @override
  List<Object> get props => [];
}

class LoadConversationsEvent extends ConversationEvent {}

class AddConversationsEvent extends ConversationEvent {
  final int convId;

  const AddConversationsEvent({required this.convId});

  @override
  List<Object> get props => [convId];
}
