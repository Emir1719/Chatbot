import 'package:flutter/material.dart';

class ChatButton extends StatelessWidget {
  const ChatButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: IconButton(
        onPressed: () async {
          /*var model = GeminiService();
          var response = await model.message("Asus bilgisayarlar ne kadar kaliteli");
          print(response);*/
        },
        icon: const Icon(Icons.send_rounded),
      ),
    );
  }
}
