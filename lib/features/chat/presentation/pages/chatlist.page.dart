import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:humanchat/common/languages.dart';
import 'package:humanchat/core/routes.dart';
import 'package:humanchat/features/chat/models/chatItemInfo.dart';
import 'package:humanchat/features/chat/presentation/bloc/chat.bloc.dart';
import 'package:humanchat/features/chat/presentation/widgets/AddChatFloatingButton.dart';
import 'package:humanchat/features/chat/presentation/widgets/ChatItem.dart';
import 'package:humanchat/features/chat/presentation/widgets/CircleAvatar.dart';

class ChatListPage extends StatelessWidget {
  final chatBloc = Get.put(ChatBloc());

  ChatListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Languages.chatList),
        elevation: 1,
        actions: [
          IconButton(
            // onPressed: () => Get.toNamed(AppRoutes.search),
            onPressed: () => {},
            icon: const Icon(Icons.search),
          ),
          const Gap(20),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          children: [
            DrawerHeader(
              child: Row(
                children: [
                  CircularAvatarButton(
                    imagePath: '',
                    // TODO: AppRoutes.userProfile
                    onPressed: () => Get.toNamed(''),
                  ),
                  const Gap(16),
                  const Text('Username'),
                  const Expanded(child: SizedBox()),
                  IconButton(
                    onPressed: () => {},
                    icon: const Icon(Icons.settings),
                  )
                ],
              ),
            ),
            const ListTile(
              title: Text('Chats'),
            ),
            const Divider(),
            ListTile(
              title: Text(Languages.chatArchived),
            ),
            const Divider(),
            ListTile(
              title: Text(Languages.chatHided),
            ),
            const Divider(),
            TextButton(
              onPressed: () {},
              child: Text('logout'.tr),
            ),
          ],
        ),
      ),
      body: Obx(() => ListView(
            children: chatBloc.channels.value
                .map((chat) => ChatItem(
                      chatInfo: ChatItemInfo(
                        name: chat.name,
                        lastTime: 'chat.lastTime',
                        lastMsg: 'chat.lastMsg',
                      ),
                      onTap: () => Get.toNamed(AppRoutes.chatList),
                    ))
                .toList(),
          )),
      floatingActionButton: const AddChatFloatingButton(),
    );
  }
}
