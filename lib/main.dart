import 'package:chatbot/config/service_locator.dart';
import 'package:chatbot/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:chatbot/features/chat/presentation/bloc/conversation/conversation_bloc.dart';
import 'package:chatbot/features/chat/presentation/bloc/message_cubit/message_cubit.dart';
import 'package:chatbot/features/models/presentation/bloc/models_bloc.dart';
import 'package:chatbot/features/models/presentation/pages/models_view.dart';
import 'package:chatbot/features/theme/presentation/cubit/theme_cubit.dart';
import 'package:chatbot/util/app_color_scheme.dart';
import 'package:chatbot/util/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupLocator();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<ModelsBloc>()),
        BlocProvider(create: (_) {
          final conversationBloc = getIt<ConversationBloc>();
          conversationBloc.add(LoadConversationsEvent());
          return conversationBloc;
        }),
        BlocProvider(create: (_) => getIt<ChatBloc>()),
        BlocProvider(create: (_) => getIt<MessageCubit>()),
        BlocProvider(create: (_) => getIt<ThemeCubit>()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.theme(AppColorScheme.light),
            darkTheme: AppTheme.theme(AppColorScheme.dark),
            themeMode: state.mode,
            home: const ModelsView(),
          );
        },
      ),
    );
  }
}
