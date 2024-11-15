import 'package:chatbot/features/models/domain/extensions/model_extension.dart';
import 'package:chatbot/features/models/presentation/bloc/models_bloc.dart';
import 'package:chatbot/util/extensions/context_extension.dart';
import 'package:chatbot/util/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatbotLogo extends StatelessWidget {
  const ChatbotLogo({super.key});

  @override
  Widget build(BuildContext context) {
    const space = SizedBox(height: 10);
    final model = context.read<ModelsBloc>().model;

    return Column(
      children: [
        Image.asset(model?.toPath() ?? AppImage.technologyExpert, height: 75),
        space,
        Text(
          "Size nasıl yardımcı olabilirim?",
          style: context.text.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
