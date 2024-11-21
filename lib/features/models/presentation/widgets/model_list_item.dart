import 'package:chatbot/features/chat/presentation/pages/chat/chat_view.dart';
import 'package:chatbot/features/models/data/models/i_chatbot.dart';
import 'package:chatbot/features/models/domain/extensions/model_extension.dart';
import 'package:chatbot/features/models/presentation/bloc/models_bloc.dart';
import 'package:chatbot/features/models/presentation/widgets/model_image.dart';
import 'package:chatbot/util/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ModelListItem extends StatelessWidget {
  const ModelListItem({super.key, required this.model});
  final IChatbot model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<ModelsBloc>().add(SelectModelEvent(model: model));

        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ChatView()),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: context.color.primaryContainer,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: context.color.onPrimaryContainer, width: 1),
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ModelImage(model: model),
            SizedBox(height: 10),
            Text(
              model.displayName ?? model.toName(),
              style: context.text.bodyMedium!.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10),
            Text(model.description, style: context.text.bodySmall, maxLines: 4),
          ],
        ),
      ),
    );
  }
}
