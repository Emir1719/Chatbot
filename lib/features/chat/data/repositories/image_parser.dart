import 'dart:convert';
import 'dart:typed_data';

import 'package:chatbot/features/chat/presentation/pages/image/image_view.dart';
import 'package:flutter/material.dart';

class ImageParser {
  static final _instance = ImageParser._();
  ImageParser._();
  factory ImageParser() => _instance;

  /// Base64 veriyi görselle dönüştürme ve görüntüleme
  static Widget build(BuildContext context, String? base64String) {
    if (base64String == null || base64String.isEmpty) {
      return SizedBox(); // Görsel yoksa boş bir widget döndür
    }

    Uint8List bytes = base64Decode(base64String);

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ImageView(bytes: bytes)),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.memory(
            bytes,
            height: 140,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
