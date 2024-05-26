import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:humanchat/core/cache.dart';
import 'package:humanchat/core/routes.dart';
import 'package:humanchat/features/auth/connect/connect.dart';
import 'package:humanchat/features/auth/presentation/widgets/welcome.dart';
import 'package:humanchat/utils/check_network.dart';

Future<void> checkToken() async {
  var gotToken = await Cache().getToken();
  if (gotToken == null) {
    log("Token in cache not found. Go to login.");
    Get.toNamed(AppRoutes.login);
    return;
  }
  if (await AuthConnect().checkToken(token: gotToken)) {
    // authBloc.token.value = gotToken;
    Get.toNamed(AppRoutes.chatList);
    return;
  }
  if (await checkNetwork()) {
    Get.toNamed(AppRoutes.login);
    return;
  }
  Get.toNamed(AppRoutes.chatList);
  return;
}

class Landing extends StatelessWidget {
  const Landing({super.key});

  // final AuthBloc authBloc = Get.put(AuthBloc());

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => checkToken());
    log('Loading page build');
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Welcome(),
          Gap(20),
          Center(
            heightFactor: 3,
            child: CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}
