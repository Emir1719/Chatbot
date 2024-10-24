import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageCubit extends Cubit<String> {
  final TextEditingController controller = TextEditingController();

  MessageCubit() : super('');

  void updateMessage(String message) {
    emit(message);
  }

  void clearMessage() {
    controller.clear(); // Mesaj kutusunu temizler
    emit(''); // Cubit state'i sıfırlanır
  }
}
