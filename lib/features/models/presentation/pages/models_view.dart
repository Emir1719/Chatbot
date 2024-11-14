import 'package:chatbot/features/chat/presentation/pages/chat/chat_view.dart';
import 'package:chatbot/features/models/data/models/chatbots.dart';
import 'package:chatbot/features/models/domain/extensions/model_extension.dart';
import 'package:chatbot/features/models/presentation/bloc/models_bloc.dart';
import 'package:chatbot/features/models/presentation/widgets/model_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ModelsView extends StatelessWidget {
  const ModelsView({super.key});

  @override
  Widget build(BuildContext context) {
    final models = Chatbots.values;

    return Scaffold(
      appBar: AppBar(title: const Text('All Models')),
      body: ListView.builder(
        itemCount: models.length,
        itemBuilder: (context, index) {
          var model = models[index];

          return ListTile(
            onTap: () {
              context.read<ModelsBloc>().add(SelectModelEvent(model: model));

              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ChatView()),
              );
            },
            leading: ModelImage(model: model),
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            title: Text(model.displayName ?? model.toName()),
          );
        },
      ),
    );
  }
}
