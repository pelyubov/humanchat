import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:humanchat/common/languages.dart';
import 'package:humanchat/core/routes.dart';
import 'package:humanchat/features/auth/connect/connect.dart';
import 'package:humanchat/features/auth/presentation/bloc/auth.bloc.dart';
import 'package:humanchat/features/auth/presentation/pages/loading.page.dart';
import 'package:humanchat/features/auth/presentation/widgets/email_text_field.dart';
import 'package:humanchat/features/auth/presentation/widgets/heading.dart';
import 'package:humanchat/features/auth/presentation/widgets/submit_button.dart';
import 'package:humanchat/utils/validate/is_email.dart';
import 'package:humanchat/utils/validate/is_password.dart';
import 'package:humanchat/utils/widget_utils.dart';

class LoginPage extends StatelessWidget {
  final authBloc = Get.put(AuthBloc());
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  LoginPage({super.key});

  get email => authBloc.email.value;
  set email(value) => authBloc.email.value = value;

  get password => authBloc.password.value;
  set password(value) => authBloc.password.value = value;

  Future<void> _login() async {
    if (!isEmail(email: email) || !isPassword(password: password)) {
      return;
    }
    loading.value = true;
    email = emailController.text;
    password = passwordController.text;
    try {
      authBloc.token.value = await AuthConnect().login(email: email, password: password);
      Get.offAllNamed(AppRoutes.chat);
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
                EmailTextField(controller: emailController, email: email),
                const Gap(30),
                // PasswordTextField(passwordObj: _passwordWidget),
                const Gap(10),
                URight(
                  child: TextButton(
                    // Get.toNamed(AppRoutes.forgotPassword)
                    onPressed: () => {},
                    child: Text('forgot_password'.tr),
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
          if (loading.value) const Loading() else Container(),
        ],
      ),
    );
  }
}
