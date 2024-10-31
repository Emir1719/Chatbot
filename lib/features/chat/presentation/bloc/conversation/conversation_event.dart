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

class DeleteConversationsEvent extends ConversationEvent {
  final int convId;

  const DeleteConversationsEvent({required this.convId});

  @override
  List<Object> get props => [convId];
}

class CreateConversationsEvent extends ConversationEvent {}

class EditConversationTitleEvent extends ConversationEvent {
  final int convId;
  final String title;

  const EditConversationTitleEvent({required this.convId, required this.title});

  @override
  List<Object> get props => [convId, title];
}
