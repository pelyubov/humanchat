import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:humanchat/common/languages.dart';
import 'package:humanchat/core/routes.dart';
import 'package:humanchat/features/auth/connect/connect.dart';
import 'package:humanchat/features/auth/presentation/bloc/auth.bloc.dart';
import 'package:humanchat/features/auth/presentation/bloc/login.bloc.dart';
import 'package:humanchat/features/auth/presentation/widgets/email_text_field.dart';
import 'package:humanchat/features/auth/presentation/widgets/password_text_field.dart';
import 'package:humanchat/features/auth/presentation/widgets/submit_button.dart';
import 'package:humanchat/features/auth/presentation/widgets/welcome.dart';
import 'package:humanchat/utils/widget_utils.dart';

class LoginPage extends StatelessWidget {
  final authBloc = Get.put(AuthBloc());
  final loginBloc = Get.put(LoginBloc());

  LoginPage({super.key});

  get email => loginBloc.emailController.text;

  get password => loginBloc.passwordController.value;

  Future<void> _login() async {
    if (!loginBloc.isValid()) {
      log(loginBloc.emailState.value.name);
      return;
    }
    loading.value = true;
    try {
      authBloc.token.value = await AuthConnect().login(email: email, password: password);
      Get.offAllNamed(AppRoutes.chatList);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      loading.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Welcome(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Obx(
                  () => EmailTextField(
                    controller: loginBloc.emailController,
                    emailState: loginBloc.emailState.value,
                  ),
                ),
                const Gap(30),
                PasswordTextField(controller: loginBloc.passwordController),
                const Gap(10),
                URight(
                  child: TextButton(
                    // Get.toNamed(AppRoutes.forgotPassword)
                    onPressed: () => {},
                    child: Text(Languages.forgotPassword),
                  ),
                ),
                const Gap(10),
                SubmitButton(text: Languages.login, onPressed: _login),
                const Gap(10),
                URight(child: Text(Languages.registerQuestion)),
                const Gap(10),
                SubmitButton(
                  text: Languages.register,
                  // Get.toNamed(AppRoutes.register)
                  onPressed: () => {},
                )
              ],
            ),
          ),
          if (loading.value) const CircularProgressIndicator() else Container(),
        ],
      ),
    );
  }
}
