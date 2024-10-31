import 'package:flutter/material.dart';

class AppMessage {
  static Future<String?> showInputDialog(BuildContext context) async {
    TextEditingController textController = TextEditingController();

    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Metin Girin'),
          content: TextField(
            controller: textController,
            decoration: const InputDecoration(hintText: 'Metninizi buraya girin'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('İptal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Tamam'),
              onPressed: () {
                Navigator.of(context).pop(textController.text);
              },
            ),
          ],
        );
      },
    );
  }
}
