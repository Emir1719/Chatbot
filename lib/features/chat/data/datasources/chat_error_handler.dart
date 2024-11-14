import 'package:dio/dio.dart';

class ChatErrorHandler {
  static final _instance = ChatErrorHandler._();
  ChatErrorHandler._();
  factory ChatErrorHandler() => _instance;

  static Exception handle(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return Exception("Bağlantı zaman aşımına uğradı");
      case DioExceptionType.receiveTimeout:
        return Exception("Sunucudan yanıt alınamadı, zaman aşımına uğradı");
      case DioExceptionType.badResponse:
        // Sunucu yanıtı ile ilgili hata
        final statusCode = error.response?.statusCode;
        final message = error.response?.statusMessage ?? "Bilinmeyen sunucu hatası";
        return Exception("Sunucu hatası: $statusCode - $message");
      case DioExceptionType.sendTimeout:
        return Exception("İstek gönderme zaman aşımına uğradı");
      case DioExceptionType.cancel:
        return Exception("İstek iptal edildi");
      default:
        return Exception("Bilinmeyen bir hata oluştu: ${error.message}");
    }
  }
}
