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
          const Text(
            "Konuşmalar",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_circle_outline_rounded),
          ),
        ],
      ),
    );
  }
}
