// ignore_for_file: avoid_print

import 'package:chatbot/features/chat/data/models/chat_message.dart';
import 'package:chatbot/features/chat/data/models/conversation.dart';
import 'package:dio/dio.dart';

class ChatService {
  final _dio = Dio(BaseOptions(baseUrl: "http://10.0.2.2:5000/chat/"));

  Future<List<Conversation>?> getConversations() async {
    try {
      final response = await _dio.get("/conversations");
      List<dynamic>? data = response.data["data"]; // JSON'daki 'data' listesini alıyoruz.

      return data?.map((json) => Conversation.fromMap(json)).toList();
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<List<ChatMessage>?> getChatsByConvId(int convId) async {
    try {
      final response = await _dio.get("/$convId");
      List<dynamic>? data = response.data["data"];

      return data?.map((json) => ChatMessage.fromMap(json)).toList();
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future deleteConversationById(int id) async {
    await _dio.delete("/conversations/$id");
  }

  Future deleteChatById(int id) async {
    await _dio.delete("/$id");
  }

  Future updateConversationById(int id, String title) async {
    final conv = Conversation(id: id, title: title);
    await _dio.put("/conversations/update", data: conv.toMap());
  }

  Future createConversation() async {
    await _dio.post("/conversations/create");
  }

  Future saveChatByConversationId(int convId, String message) async {
    await _dio.post("/save", data: {"id": convId, "user_message": message});
  }
}
