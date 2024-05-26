import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:humanchat/core/routes.dart';

class AddChatFloatingButton extends StatelessWidget {
  const AddChatFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Get.toNamed(AppRoutes.chatAdd),
      // Get.toNamed(AppRoutes.chatAdd);,
      child: const Icon(Icons.add),
    );
  }
}
