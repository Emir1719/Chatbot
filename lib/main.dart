import 'package:chatbot/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:chatbot/features/chat/presentation/bloc/conversation/conversation_bloc.dart';
import 'package:chatbot/features/chat/presentation/bloc/message_cubit/message_cubit.dart';
import 'package:chatbot/features/chat/presentation/pages/chat/chat_view.dart';
import 'package:chatbot/features/theme/presentation/cubit/theme_cubit.dart';
import 'package:chatbot/util/app_color_scheme.dart';
import 'package:chatbot/util/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ConversationBloc()..add(LoadConversationsEvent())),
        BlocProvider(create: (context) => ChatBloc(context.read<ConversationBloc>())),
        BlocProvider(create: (context) => MessageCubit()),
        BlocProvider(create: (context) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.theme(AppColorScheme.light),
            darkTheme: AppTheme.theme(AppColorScheme.dark),
            themeMode: state.mode,
            home: const ChatView(),
          );
        },
      ),
    );
  }
}
