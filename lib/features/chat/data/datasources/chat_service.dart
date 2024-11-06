import 'package:chatbot/features/chat/data/models/conversation.dart';
import 'package:chatbot/features/chat/domain/entities/chat_message.dart';
import 'package:dio/dio.dart';

class ChatService {
  final _dio = Dio(BaseOptions(baseUrl: "http://10.0.2.2:5000/chat/"));

  Future<List<Conversation>?> getConversations() async {
    try {
      final response = await _dio.get("/conversations");
      List<dynamic>? data = response.data["data"]; // JSON'daki 'data' listesini alıyoruz.

      return data?.map((json) => Conversation.fromMap(json)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<ChatMessage>?> getChatsByConvId(int convId) async {
    try {
      final response = await _dio.get("/$convId");
      List<dynamic>? data = response.data["data"];

      return data?.map((json) => ChatMessage.fromMap(json)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future deleteConversationById(int id) async {
    try {
      await _dio.delete("/conversations/$id");
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  Future deleteChatById(int id) async {
    try {
      await _dio.delete("/$id");
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  Future updateConversationById(int id, String title) async {
    final conv = Conversation(id: id, title: title);

    try {
      await _dio.put("/conversations/update", data: conv.toMap());
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  Future<Conversation> createConversation() async {
    try {
      final response = await _dio.post("/conversations/create");
      int? convId = response.data["data"]["id"];

      if (convId != null) {
        final conv = Conversation(id: convId, title: "Yeni");
        return conv;
      }
      throw Exception("Conversation null geldi");
    } catch (e) {
      throw Exception(e);
    }
  }

  Future sendMessageByConversationId(int convId, String message, [String? imagePath]) async {
    try {
      FormData formData = FormData.fromMap({
        "id": convId,
        "user_message": message,
        "image": imagePath != null
            ? await MultipartFile.fromFile(imagePath, filename: imagePath.split('/').last)
            : null,
      });

      await _dio.post(
        "/send",
        data: formData,
        options: Options(contentType: 'multipart/form-data'),
      );
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
