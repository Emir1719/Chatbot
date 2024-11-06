// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ChatMessage {
  final int id;
  final String userMessage;
  final String modelMessage;
  final String? modelImage;
  final String? userImage;
  final String? createdAt;

  ChatMessage({
    required this.id,
    required this.userMessage,
    required this.modelMessage,
    this.modelImage,
    this.userImage,
    this.createdAt,
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
      userImage: userMessage,
      modelImage: modelMessage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message_id': id,
      'user_message': userMessage,
      'model_message': modelMessage,
      'model_image': modelImage,
      'user_image': userImage,
      'created_at': createdAt,
    };
  }

  factory ChatMessage.fromMap(Map<String, dynamic> map) {
    return ChatMessage(
      id: map['message_id'] as int,
      userMessage: map['user_message'] as String,
      modelMessage: map['model_message'] as String,
      modelImage: map['model_image'] as String?,
      userImage: map['user_image'] as String?,
      createdAt: map['created_at'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatMessage.fromJson(String source) =>
      ChatMessage.fromMap(json.decode(source) as Map<String, dynamic>);
}
