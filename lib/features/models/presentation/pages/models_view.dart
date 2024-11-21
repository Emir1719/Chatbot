import 'package:chatbot/features/models/data/models/chatbots.dart';
import 'package:chatbot/features/models/presentation/widgets/model_list_item.dart';
import 'package:flutter/material.dart';

class ModelsView extends StatelessWidget {
  const ModelsView({super.key});

  @override
  Widget build(BuildContext context) {
    final models = Chatbots.values;

    return Scaffold(
      appBar: AppBar(title: const Text('AI Assistants')),
      body: GridView.builder(
        itemCount: models.length,
        padding: EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisExtent: 220,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          var model = models[index];

          return ModelListItem(model: model);
        },
      ),
    );
  }
}
