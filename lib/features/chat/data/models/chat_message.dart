// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ChatMessage {
  final int id;
  final String userMessage;
  final String modelMessage;

  ChatMessage({
    required this.id,
    required this.userMessage,
    required this.modelMessage,
  });

  ChatMessage copyWith({
    int? id,
    String? userMessage,
    String? modelMessage,
  }) {
    return ChatMessage(
      id: id ?? this.id,
      userMessage: userMessage ?? this.userMessage,
      modelMessage: modelMessage ?? this.modelMessage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'chat_id': id,
      'user_message': userMessage,
      'model_message': modelMessage,
    };
  }

  factory ChatMessage.fromMap(Map<String, dynamic> map) {
    return ChatMessage(
      id: map['chat_id'] as int,
      userMessage: map['user_message'] as String,
      modelMessage: map['model_message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatMessage.fromJson(String source) =>
      ChatMessage.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ChatMessage(id: $id, userMessage: $userMessage, modelMessage: $modelMessage)';

  @override
  bool operator ==(covariant ChatMessage other) {
    if (identical(this, other)) return true;

    return other.id == id && other.userMessage == userMessage && other.modelMessage == modelMessage;
  }

  @override
  int get hashCode => id.hashCode ^ userMessage.hashCode ^ modelMessage.hashCode;
}
