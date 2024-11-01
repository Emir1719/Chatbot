import 'package:chatbot/features/chat/data/models/chat.dart';
import 'package:chatbot/features/chat/data/models/chat_message.dart';
import 'package:chatbot/features/chat/data/models/sender.dart';

extension ChatMessageExtension on ChatMessage {
  List<Chat> toChats() {
    return [
      Chat(id: id, sender: Sender.user, message: userMessage),
      Chat(id: id, sender: Sender.model, message: modelMessage),
    ];
  }
}
