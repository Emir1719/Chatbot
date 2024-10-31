import 'package:chatbot/features/chat/presentation/widgets/chat/conv_add_button.dart';
import 'package:chatbot/util/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class ConversationTitle extends StatelessWidget {
  const ConversationTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Konuşmalar", style: context.text.bodyLarge),
          const ConvAddButton(),
        ],
      ),
    );
  }
}
