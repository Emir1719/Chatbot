import 'package:flutter/material.dart';

class ConversationPopupButton extends StatelessWidget {
  const ConversationPopupButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      tooltip: "Konuşma Ayarları",
      onSelected: (value) {},
      itemBuilder: (BuildContext context) {
        return [
          const PopupMenuItem(
            value: 'sil',
            child: Text('Sil'),
          ),
          const PopupMenuItem(
            value: 'duzenle',
            child: Text('Düzenle'),
          ),
        ];
      },
      child: const Icon(Icons.more_vert), // Menü simgesi
    );
  }
}
