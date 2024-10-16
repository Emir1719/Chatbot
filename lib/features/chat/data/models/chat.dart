// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:chatbot/features/chat/data/models/sender.dart';

class Chat {
  final Sender sender;
  final String message;

  Chat({required this.sender, required this.message});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sender': sender.name,
      'message': message,
    };
  }

  factory Chat.fromMap(Map<String, dynamic> map) {
    return Chat(
      sender: Sender.values.byName(map["sender"]),
      message: map['message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Chat.fromJson(String source) => Chat.fromMap(json.decode(source) as Map<String, dynamic>);
}
