import 'package:flutter_bloc/flutter_bloc.dart';

class MessageCubit extends Cubit<String> {
  MessageCubit() : super('');

  void updateMessage(String message) {
    emit(message);
  }
}
