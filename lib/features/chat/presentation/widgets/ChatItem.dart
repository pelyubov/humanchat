import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:humanchat/features/chat/models/chatItemInfo.dart';
import 'package:humanchat/features/chat/presentation/widgets/CircleAvatar.dart';
import 'package:humanchat/features/chat/presentation/widgets/ToProfileAction.dart';

class ChatItem extends StatelessWidget {
  final ChatItemInfo chatInfo;
  final VoidCallback? onTap;
  const ChatItem({
    super.key,
    required this.chatInfo,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: super.key,
      startActionPane: const ActionPane(motion: ScrollMotion(), children: [ToProfileAction()]),
      endActionPane: const ActionPane(motion: ScrollMotion(), children: [
        // Archive(chatName: chatInfo.name),
        // ChatDelete(chatName: chatInfo.name),
      ]),
      child: ListTile(
        title: Text(chatInfo.name),
        leading: CircularAvatarButton(
          imagePath: '',
          // TODO AppRoutes.userProfile
          onPressed: () {},
        ),
        trailing: Text(chatInfo.lastTime),
        subtitle: Text(chatInfo.lastMsg),
        onTap: onTap,
      ),
    );
  }
}
