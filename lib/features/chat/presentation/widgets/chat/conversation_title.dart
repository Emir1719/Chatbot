import 'package:flutter/material.dart';

class ConversationTitle extends StatelessWidget {
  const ConversationTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Konuşmalar",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          ),
          Icon(Icons.add_circle_outline_rounded),
        ],
      ),
    );
  }
}
