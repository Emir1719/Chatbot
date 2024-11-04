// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:equatable/equatable.dart';

class MessageState extends Equatable {
  final String message;
  final File? file;

  const MessageState({required this.message, required this.file});

  @override
  List<Object?> get props => [message, file];

  MessageState copyWith({
    String? message,
    File? file,
  }) {
    return MessageState(
      message: message ?? this.message,
      file: file,
    );
  }
}
