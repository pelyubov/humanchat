import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:humanchat/features/chat/presentation/widgets/MediaDrawer.dart';

class ChatInputBar extends StatefulWidget {
  const ChatInputBar({super.key, this.attachFileButtonHandle});
  final Widget Function()? attachFileButtonHandle;

  @override
  State<ChatInputBar> createState() => _ChatInputBarState();
}

class _ChatInputBarState extends State<ChatInputBar> {
  void showMediaDrawer() {
    showBottomSheet(
      context: context,
      builder: (context) => MediaDrawer(
        onClosed: () {},
      ),
      enableDrag: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          if (MediaQuery.of(context).viewInsets.bottom <= 0) ...[
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.camera_alt_rounded),
              alignment: Alignment.bottomCenter,
            ),
            const Gap(10),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.mic),
              alignment: Alignment.bottomCenter,
            ),
            const Gap(10),
            IconButton(
              onPressed: showMediaDrawer,
              icon: const Icon(Icons.attach_file),
              alignment: Alignment.bottomCenter,
            ),
            const Gap(10),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.emoji_emotions_rounded),
                  ),
                  hintText: 'Type a message',
                  fillColor: Colors.grey[200],
                ),
                maxLines: null,
              ),
            ),
          ],
          const Gap(10),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.send_rounded),
            alignment: Alignment.bottomCenter,
          )
        ],
      ),
    );
  }
}
