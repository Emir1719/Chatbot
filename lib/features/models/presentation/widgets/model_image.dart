import 'package:chatbot/features/models/data/models/i_chatbot.dart';
import 'package:chatbot/features/models/domain/extensions/model_extension.dart';
import 'package:chatbot/util/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class ModelImage extends StatelessWidget {
  const ModelImage({super.key, required this.model});
  final IChatbot model;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: context.color.primaryContainer,
      radius: 34,
      child: Image.asset(model.toPath(), fit: BoxFit.contain, height: 55),
    );
  }
}
