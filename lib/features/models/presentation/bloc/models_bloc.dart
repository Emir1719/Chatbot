import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chatbot/config/service_locator.dart';
import 'package:chatbot/features/chat/data/datasources/chat_service.dart';
import 'package:chatbot/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:chatbot/features/models/data/models/chatbots.dart';
import 'package:equatable/equatable.dart';

part 'models_event.dart';
part 'models_state.dart';

class ModelsBloc extends Bloc<ModelsEvent, ModelsState> {
  final _chatService = getIt<ChatService>();
  Chatbots? model;

  ModelsBloc() : super(ModelsInitial()) {
    on<SelectModelEvent>(_selectModel);
  }

  FutureOr<void> _selectModel(SelectModelEvent event, emit) async {
    emit(ModelsLoading());

    try {
      model = event.model;

      await _chatService.selectModel(model!.modelName);

      getIt<ChatBloc>().add(ChatRestart());

      emit(ModelsLoaded(model: model!));
    } catch (e) {
      emit(ModelsError(message: e.toString()));
    }
  }
}
