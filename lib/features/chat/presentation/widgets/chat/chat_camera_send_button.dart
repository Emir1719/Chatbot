import 'package:chatbot/features/chat/presentation/bloc/message_cubit/message_cubit.dart';
import 'package:chatbot/features/chat/presentation/bloc/message_cubit/message_state.dart';
import 'package:chatbot/util/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatCameraSendButton extends StatelessWidget {
  const ChatCameraSendButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MessageCubit, MessageState>(
      builder: (context, state) {
        final cubit = context.read<MessageCubit>();

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: IconButton(
            onPressed:
                cubit.haveFile() ? cubit.onDeleteFile(context) : cubit.onPressedCamera(context),
            icon: Icon(
              cubit.haveFile() ? Icons.clear : Icons.camera_alt_outlined,
              color: context.color.secondary,
            ),
          ),
        );
      },
    );
  }
}
