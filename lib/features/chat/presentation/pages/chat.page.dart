import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:humanchat/features/chat/presentation/bloc/chat.bloc.dart';
import 'package:humanchat/features/chat/presentation/widgets/InputChatBar.dart';
import 'package:humanchat/features/chat/presentation/widgets/MessageItem.dart';
import 'package:humanchat/utils/snowflake.dart';

class ChatPage extends StatelessWidget {
  final chatBloc = Get.put(ChatBloc());

  ChatPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_rounded),
        ),
        actions: [
          IconButton(
            // TODO: set audio call route
            onPressed: () => Get.to(() => {}),
            icon: const Icon(Icons.call_rounded),
          ),
          const Gap(6),
          IconButton(
            // TODO: set video call route
            onPressed: () => Get.toNamed(''),
            icon: const Icon(Icons.video_call_rounded),
          ),
          const Gap(6),
          IconButton(
            // onPressed: () => Get.to(const ChatSettingsPage()),
            onPressed: () => {},
            icon: const Icon(Icons.info_outline_rounded),
          ),
          const Gap(6)
        ],
        title: const Text('Chat Page'),
      ),
      body: Column(
        children: [
          Obx(() => Expanded(
                  child: ListView(
                children: chatBloc
                    .getMessage(currentChannelId: chatBloc.currentChannelId.value!)
                    .map((e) => MessageItem(
                          message: e.content,
                          createAt: Snowflake.timestamp(e.messageId),
                          messageState: MessageState.seen,
                          username: e.author.toString(),
                          messagePosition: MessagePosition.left, // TODO get accountId
                        ))
                    .toList(),
              ))),
          const ChatInputBar(),
        ],
      ),
    );
  }
}
