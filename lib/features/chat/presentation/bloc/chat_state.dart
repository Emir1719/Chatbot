part of 'chat_bloc.dart';

abstract class ChatState extends Equatable {
  const ChatState();

  /// Her durum için bir build metodu
  Widget build(BuildContext context);

  @override
  List<Object> get props => [];
}

class ChatInitial extends ChatState {
  @override
  Widget build(BuildContext context) => ChatbotGreeting();
}

class ChatLoading extends ChatState {
  @override
  Widget build(BuildContext context) => AppLoading();
}

class ChatError extends ChatState {
  final String message;

  const ChatError({required this.message});

  @override
  Widget build(BuildContext context) => AppErrorView(message: message);

  @override
  List<Object> get props => [message];
}

class ChatLoaded extends ChatState {
  final List<Chat>? chats;
  final bool isLoading;

  const ChatLoaded({required this.chats, this.isLoading = false});

  @override
  Widget build(BuildContext context) => ChatListView(chats: chats, isLoading: isLoading);

  @override
  List<Object> get props => [chats ?? [], isLoading];
}
