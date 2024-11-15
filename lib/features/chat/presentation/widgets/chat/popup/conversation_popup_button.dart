import 'package:chatbot/features/chat/presentation/widgets/chat/popup/conv_popup.dart';
import 'package:flutter/material.dart';

class ConversationPopupButton extends StatelessWidget {
  const ConversationPopupButton({super.key, required this.convId});
  final int convId;

  @override
  Widget build(BuildContext context) {
    final List<IConvPopup> menuItems = [
      EditPopup(),
      DeletePopup(),
    ];

    return PopupMenuButton<IConvPopup>(
      tooltip: "Konuşma Ayarları",
      onSelected: (value) => value.onTap(context, convId),
      itemBuilder: (BuildContext context) {
        return menuItems.map((item) {
          return PopupMenuItem<IConvPopup>(
            value: item,
            child: Row(
              children: [
                Icon(item.icon, size: 20),
                const SizedBox(width: 10),
                Text(item.name),
              ],
            ),
          );
        }).toList();
      },
      child: const Icon(Icons.more_vert), // Menü simgesi
    );
  }
}
