import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class ToProfileAction extends StatelessWidget {
  const ToProfileAction({super.key});

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      // TODO AppRoutes.accountProfile
      onPressed: (context) => {Get.toNamed('')},
      icon: Icons.home,
    );
  }
}
