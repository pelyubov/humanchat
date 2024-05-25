import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:humanchat/core/cache.dart';
import 'package:humanchat/core/routes.dart';
import 'package:humanchat/features/auth/connect/connect.dart';
import 'package:humanchat/features/auth/presentation/bloc/auth.bloc.dart';
import 'package:humanchat/features/auth/presentation/widgets/heading.dart';
import 'package:humanchat/utils/check_network.dart';

class Loading extends StatelessWidget {
  static final AuthBloc authBloc = Get.put(AuthBloc());
  const Loading({super.key});

  checkToken() async {
    var gotToken = await Cache().getToken();
    if (gotToken == null) {
      Get.toNamed(AppRoutes.signUp);
      return;
    }
    if (await AuthConnect().checkToken(token: gotToken)) {
      authBloc.token.value = gotToken;
      Get.toNamed(AppRoutes.chat);
      return;
    }
    if (await checkNetwork()) {
      Get.toNamed(AppRoutes.login);
      return;
    }
    Get.toNamed(AppRoutes.chat);
    return;
  }

  @override
  Widget build(BuildContext context) {
    checkToken();
    return const Column(
      children: [
        Welcome(),
        Gap(20),
        Center(
          heightFactor: 3,
          child: CircularProgressIndicator(),
        ),
      ],
    );
  }
}
