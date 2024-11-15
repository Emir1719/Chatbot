import 'package:chatbot/features/chat/presentation/widgets/chat/greeting/chatbot_conv_starters.dart';
import 'package:chatbot/features/chat/presentation/widgets/chat/greeting/chatbot_logo.dart';
import 'package:flutter/material.dart';

class ChatbotGreeting extends StatelessWidget {
  const ChatbotGreeting({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 2),
            ChatbotLogo(),
            Spacer(),
            orientation == Orientation.portrait ? ChatbotConvStarters() : SizedBox(),
            Spacer(flex: 2),
          ],
        );
      },
    );
  }
}
