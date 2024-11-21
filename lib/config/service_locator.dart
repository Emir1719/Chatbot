import 'package:chatbot/features/chat/data/datasources/chat_service.dart';
import 'package:chatbot/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:chatbot/features/chat/presentation/bloc/conversation/conversation_bloc.dart';
import 'package:chatbot/features/chat/presentation/bloc/message_cubit/message_cubit.dart';
import 'package:chatbot/features/models/presentation/bloc/models_bloc.dart';
import 'package:chatbot/features/theme/data/theme_storage.dart';
import 'package:chatbot/features/theme/presentation/cubit/theme_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt getIt = GetIt.instance;

Future setupLocator() async {
  getIt.registerLazySingleton<ChatService>(() => ChatService(
        Dio(BaseOptions(baseUrl: "http://10.0.2.2:5000/chat/")),
      ));

  SharedPreferences pref = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<ThemeStorage>(() => ThemeStorage(pref));

  getIt.registerLazySingleton<ConversationBloc>(() => ConversationBloc());
  getIt.registerLazySingleton<ChatBloc>(() => ChatBloc(getIt<ConversationBloc>()));
  getIt.registerLazySingleton<MessageCubit>(() => MessageCubit());
  getIt.registerLazySingleton<ThemeCubit>(() => ThemeCubit(getIt<ThemeStorage>()));
  getIt.registerLazySingleton<ModelsBloc>(() => ModelsBloc());
}
