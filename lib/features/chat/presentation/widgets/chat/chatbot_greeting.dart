import 'package:chatbot/util/image.dart';
import 'package:flutter/material.dart';

class ChatbotGreeting extends StatelessWidget {
  const ChatbotGreeting({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AppImage.chatbot, height: 75),
        const SizedBox(height: 10),
        const Text(
          "Size nasıl yardımcı olabilirim?",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
