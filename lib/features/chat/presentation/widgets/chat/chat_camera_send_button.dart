import 'package:chatbot/features/chat/presentation/bloc/message_cubit/message_cubit.dart';
import 'package:chatbot/util/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatCameraSendButton extends StatelessWidget {
  const ChatCameraSendButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MessageCubit, String>(
      builder: (context, message) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.camera_alt_outlined,
              color: context.color.secondary,
            ),
          ),
        );
      },
    );
  }
}
