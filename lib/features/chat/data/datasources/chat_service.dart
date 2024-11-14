import 'package:chatbot/features/chat/data/datasources/chat_error_handler.dart';
import 'package:chatbot/features/chat/data/models/conversation.dart';
import 'package:chatbot/features/chat/domain/entities/chat_message.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

class ChatService {
  final Dio _dio;

  ChatService(this._dio) {
    // Bu olmadan flask'daki session çalışmadı.
    _dio.interceptors.add(CookieManager(CookieJar())); // Cookie yöneticisi ekleniyor
  }

  Future<List<Conversation>?> getConversations() async {
    try {
      final response = await _dio.get("/conversations");
      List<dynamic>? data = response.data["data"]; // JSON'daki 'data' listesini alıyoruz.

      return data?.map((json) => Conversation.fromMap(json)).toList();
    } on DioException catch (e) {
      throw ChatErrorHandler.handle(e);
    } catch (e) {
      throw Exception("Beklenmeyen bir hata oluştu: $e");
    }
  }

  Future<List<ChatMessage>?> getChatsByConvId(int convId) async {
    try {
      final response = await _dio.get("/$convId");
      List<dynamic>? data = response.data["data"];

      return data?.map((json) => ChatMessage.fromMap(json)).toList();
    } on DioException catch (e) {
      throw ChatErrorHandler.handle(e);
    } catch (e) {
      throw Exception("Beklenmeyen bir hata oluştu: $e");
    }
  }

  Future deleteConversationById(int id) async {
    try {
      await _dio.delete("/conversations/$id");
    } on DioException catch (e) {
      throw ChatErrorHandler.handle(e);
    } catch (e) {
      throw Exception("Beklenmeyen bir hata oluştu: $e");
    }
  }

  Future deleteChatById(int id) async {
    try {
      await _dio.delete("/$id");
    } on DioException catch (e) {
      throw ChatErrorHandler.handle(e);
    } catch (e) {
      throw Exception("Beklenmeyen bir hata oluştu: $e");
    }
  }

  Future updateConversationById(int id, String title) async {
    final conv = Conversation(id: id, title: title);

    try {
      await _dio.put("/conversations/update", data: conv.toMap());
    } on DioException catch (e) {
      throw ChatErrorHandler.handle(e);
    } catch (e) {
      throw Exception("Beklenmeyen bir hata oluştu: $e");
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
    } on DioException catch (e) {
      throw ChatErrorHandler.handle(e);
    } catch (e) {
      throw Exception("Beklenmeyen bir hata oluştu: $e");
    }
  }

  Future<void> selectModel(String modelName) async {
    try {
      final response = await _dio.post("/model/$modelName");
      print(response.data["message"]);
    } on DioException catch (e) {
      throw ChatErrorHandler.handle(e);
    } catch (e) {
      throw Exception("Beklenmeyen bir hata oluştu: $e");
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

      final response = await _dio.post(
        "/send",
        data: formData,
        options: Options(contentType: 'multipart/form-data'),
      );

      print(response.data["message"]);
    } on DioException catch (e) {
      throw ChatErrorHandler.handle(e);
    } catch (e) {
      throw Exception("Beklenmeyen bir hata oluştu: $e");
    }
  }
}
