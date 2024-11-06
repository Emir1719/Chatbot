import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

class ImageParser {
  static final _instance = ImageParser._();
  ImageParser._();
  factory ImageParser() => _instance;

  /// Base64 veriyi görselle dönüştürme ve görüntüleme
  static Widget build(String? base64String) {
    if (base64String == null || base64String.isEmpty) {
      return SizedBox(); // Görsel yoksa boş bir widget döndür
    }

    Uint8List bytes = base64Decode(base64String);

    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Image.memory(
        bytes,
        height: 100,
        fit: BoxFit.cover,
      ),
    );
  }
}
