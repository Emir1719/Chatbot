import 'package:chatbot/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:chatbot/util/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConvStarter extends StatelessWidget {
  const ConvStarter({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<ChatBloc>().add(UserMessageEvent(message: message));
      },
      child: Container(
        width: context.width(0.9),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: context.color.primaryContainer,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: context.text.bodyMedium,
          maxLines: 2,
        ),
      ),
    );
  }
}
