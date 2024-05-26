import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:humanchat/features/chat/presentation/widgets/InputChatBar.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  var mediaOpen = true;
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
      body: const Column(
        children: [
          Text('messages'),
          Expanded(child: SizedBox()),
          ChatInputBar(),
        ],
      ),
    );
  }
}
