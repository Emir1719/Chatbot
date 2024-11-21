import 'package:chatbot/features/models/data/models/chatbots/creative_writer.dart';
import 'package:chatbot/features/models/data/models/chatbots/fashion_expert.dart';
import 'package:chatbot/features/models/data/models/chatbots/friendly_guide.dart';
import 'package:chatbot/features/models/data/models/chatbots/technology_expert.dart';
import 'package:chatbot/features/models/data/models/i_chatbot.dart';
import 'package:chatbot/features/models/presentation/widgets/model_list_item.dart';
import 'package:flutter/material.dart';

class ModelsView extends StatelessWidget {
  const ModelsView({super.key});

  @override
  Widget build(BuildContext context) {
    List<IChatbot> chatbots = [
      TechnologyExpert(),
      CreativeWriter(),
      FriendlyGuide(),
      FashionExpert(),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('AI Assistants')),
      body: GridView.builder(
        itemCount: chatbots.length,
        padding: EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisExtent: 220,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          var model = chatbots[index];

          return ModelListItem(model: model);
        },
      ),
    );
  }
}
