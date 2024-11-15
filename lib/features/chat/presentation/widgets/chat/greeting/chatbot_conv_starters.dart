import 'package:chatbot/features/chat/presentation/widgets/chat/conv_starter.dart';
import 'package:chatbot/features/models/presentation/bloc/models_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatbotConvStarters extends StatelessWidget {
  const ChatbotConvStarters({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<ModelsBloc>().model;

    // Konuşma başlatıcıları her model için dinamik olarak listelenir
    final starterWidgets = model!.starters
        .map((starter) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: ConvStarter(message: starter),
            ))
        .toList();

    return Column(children: [...starterWidgets]);
  }
}
