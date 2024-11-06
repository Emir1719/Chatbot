// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:chatbot/features/chat/data/models/sender.dart';

class Chat {
  final int id;
  final Sender sender;
  final String message;
  final String? image;

  Chat({
    required this.id,
    required this.sender,
    required this.message,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'sender': sender.name,
      'message': message,
      'image': image,
    };
  }

  factory Chat.fromMap(Map<String, dynamic> map) {
    return Chat(
      id: map["id"] as int,
      sender: Sender.values.byName(map["sender"]),
      message: map['message'] as String,
      image: map['image'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory Chat.fromJson(String source) => Chat.fromMap(json.decode(source) as Map<String, dynamic>);
}
