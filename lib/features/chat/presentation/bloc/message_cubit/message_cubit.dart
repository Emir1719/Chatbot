import 'package:chatbot/features/chat/data/datasources/image_service.dart';
import 'package:chatbot/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:chatbot/features/chat/presentation/bloc/message_cubit/message_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageCubit extends Cubit<MessageState> {
  final TextEditingController controller = TextEditingController();

  MessageCubit() : super(MessageState(message: "", file: null));

  void updateMessage(String message) {
    emit(state.copyWith(message: message.trim(), file: state.file));
  }

  void clearMessage() {
    controller.clear(); // Mesaj kutusunu temizler
    emit(state.copyWith(message: "", file: null)); // Cubit state'i sıfırlanır
  }

  /// Mesaj gönderir
  void Function()? onPressed(BuildContext context) {
    String text = controller.text.trim();

    return text.isEmpty
        ? null
        : () {
            final chat = context.read<ChatBloc>();

            // Dosya varsa
            if (haveFile()) {
              chat.add(UserMessageWithImageEvent(message: text, imageUrl: state.file!.path));
            } else {
              // Dosya yoksa
              chat.add(UserMessageEvent(message: text));
            }

            clearMessage();
          };
  }

  @override
  Future<void> close() async {
    super.close();
    controller.dispose();
  }

  /// Galeriden resim seçer
  void Function()? onPressedCamera(BuildContext context) {
    return () async {
      final imageService = ImageService();
      final file = await imageService.getImageFromGallery();

      emit(state.copyWith(file: file));
    };
  }

  /// Seçilen dosyayı siler
  void Function()? onDeleteFile(BuildContext context) {
    return () => emit(state.copyWith(file: null));
  }

  /// Dosya varsa `true` döndürür
  bool haveFile() => state.file != null;
}
