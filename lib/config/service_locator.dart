import 'package:chatbot/features/chat/data/datasources/chat_service.dart';
import 'package:chatbot/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:chatbot/features/chat/presentation/bloc/conversation/conversation_bloc.dart';
import 'package:chatbot/features/chat/presentation/bloc/message_cubit/message_cubit.dart';
import 'package:chatbot/features/theme/presentation/cubit/theme_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<ChatService>(() => ChatService(
        Dio(BaseOptions(baseUrl: "http://10.0.2.2:5000/chat/")),
      ));

  getIt.registerLazySingleton<ConversationBloc>(() => ConversationBloc());
  getIt.registerLazySingleton<ChatBloc>(() => ChatBloc(getIt<ConversationBloc>()));
  getIt.registerLazySingleton<MessageCubit>(() => MessageCubit());
  getIt.registerLazySingleton<ThemeCubit>(() => ThemeCubit());
}
