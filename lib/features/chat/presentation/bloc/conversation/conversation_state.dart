part of 'conversation_bloc.dart';

sealed class ConversationState extends Equatable {
  const ConversationState();

  @override
  List<Object> get props => [];
}

final class ConversationInitial extends ConversationState {}

final class ConversationLoading extends ConversationState {}

final class ConversationLoaded extends ConversationState {
  final List<Conversation>? conversations;

  const ConversationLoaded({required this.conversations});

  @override
  List<Object> get props => [conversations ?? []];
}

final class ConversationError extends ConversationState {
  final String message;

  const ConversationError({required this.message});

  @override
  List<Object> get props => [message];
}
