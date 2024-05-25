import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:humanchat/common/languages.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 2,
      child: Text(Languages.hello, style: Get.textTheme.displayMedium),
    );
  }
}
