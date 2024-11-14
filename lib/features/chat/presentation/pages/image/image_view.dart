import 'dart:typed_data';

import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  const ImageView({super.key, required this.bytes});
  final Uint8List bytes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Resim Detayı")),
      body: Center(
        child: InteractiveViewer(
          minScale: 0.5,
          maxScale: 2,
          child: Image.memory(
            bytes,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
