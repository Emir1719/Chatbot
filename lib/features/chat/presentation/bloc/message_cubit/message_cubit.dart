import 'package:chatbot/features/chat/data/datasources/image_service.dart';
import 'package:chatbot/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:chatbot/features/chat/presentation/bloc/message_cubit/message_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageCubit extends Cubit<MessageState> {
  final TextEditingController controller = TextEditingController();

  MessageCubit() : super(MessageState(message: "", file: null));

  void updateMessage(String message) {
    emit(state.copyWith(message: message, file: state.file));
  }

  void clearMessage() {
    controller.clear(); // Mesaj kutusunu temizler
    emit(state.copyWith(message: "", file: null)); // Cubit state'i sıfırlanır
  }

  /// Mesaj gönderir
  void Function()? onPressed(BuildContext context) {
    return controller.text.isEmpty || !haveFile()
        ? null
        : () {
            final chat = context.read<ChatBloc>();

            // Dosya varsa
            if (haveFile()) {
              chat.add(
                  UserMessageWithImageEvent(message: controller.text, imageUrl: state.file!.path));
            } else {
              // Dosya yoksa
              chat.add(UserMessageEvent(message: controller.text));
            }

            clearMessage();
          };
  }

  /// Galeriden resim seçer
  void Function()? onPressedCamera(BuildContext context) {
    return () async {
      final imageService = ImageService();
      final file = await imageService.getImageFromGallery();

      emit(state.copyWith(file: file));
      print(file?.path);
    };
  }

  /// Seçilen dosyayı siler
  void Function()? onDeleteFile(BuildContext context) {
    return () {
      print("Dosya silindi");
      emit(state.copyWith(file: null));
      print("State updated: ${state.file}");
    };
  }

  /// Dosya varsa `true` döndürür
  bool haveFile() => state.file != null;
}
