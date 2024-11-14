import 'package:chatbot/features/chat/presentation/widgets/chat/conv_starter.dart';
import 'package:chatbot/features/models/domain/extensions/model_extension.dart';
import 'package:chatbot/features/models/presentation/bloc/models_bloc.dart';
import 'package:chatbot/util/extensions/context_extension.dart';
import 'package:chatbot/util/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatbotGreeting extends StatelessWidget {
  const ChatbotGreeting({super.key});

  @override
  Widget build(BuildContext context) {
    const space = SizedBox(height: 10);
    final model = context.read<ModelsBloc>().model;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(flex: 2),
        Image.asset(model?.toPath() ?? AppImage.technologyExpert, height: 75),
        space,
        Text(
          "Size nasıl yardımcı olabilirim?",
          style: context.text.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
        ),
        Spacer(),
        ...model!.starters.map((e) => ConvStarter(message: e)),
        /*ConvStarter(message: "İşlemcinin temel görevi nedir?"),
        space,
        ConvStarter(message: "DDR5 RAM'in DDR4'e göre avantajı nedir?"),
        space,
        ConvStarter(message: "Laptop soğutucuları ne kadar faydalı?"),*/
        Spacer(flex: 2),
      ],
    );
  }
}
