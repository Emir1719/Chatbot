import 'package:chatbot/features/chat/data/models/chat.dart';
import 'package:chatbot/features/chat/data/models/sender.dart';
import 'package:chatbot/features/chat/domain/entities/chat_message.dart';

extension ChatMessageExtension on ChatMessage {
  List<Chat> toChats() {
    return [
      Chat(id: id, sender: Sender.user, message: userMessage, image: userImage),
      Chat(id: id, sender: Sender.model, message: modelMessage, image: modelImage),
    ];
  }
}
