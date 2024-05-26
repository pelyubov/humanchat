import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:humanchat/features/auth/presentation/widgets/email_text_field.dart';
import 'package:humanchat/features/auth/presentation/widgets/password_text_field.dart';
import 'package:humanchat/utils/validate/is_password.dart';

enum LoginState {
  /// The initial state of the login process.
  initial,

  /// The state of the login process when the user is submitting the form.
  submitting,

  /// The state of the login process when the user has successfully submitted
  /// the form.
  success,

  /// The state of the login process when the user has failed to submit
  /// the form.
  failure,
}

class LoginBloc extends GetxController {
  var emailState = EmailState.initial.obs;
  var passwordState = PasswordState.initial.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  onInit() {
    super.onInit();
    // emailController.addListener(() {
    //   _checkEmail(emailController.text);
    // });
    // passwordController.addListener(() {
    //   _checkPassword(passwordController.text);
    // });
    1;
  }

  @override
  onClose() {
    passwordController.dispose();
    super.onClose();
  }

  bool _checkEmail(String email) {
    if (email.length > 7) {
      emailState.value = EmailState.valid;
      return true;
    }
    emailState.value = EmailState.invalid;
    return false;
  }

  bool _checkPassword(String password) {
    if (isPassword(password: password)) {
      passwordState.value = PasswordState.valid;
      return true;
    }
    passwordState.value = PasswordState.invalid;
    return false;
  }

  bool isValid() {
    if (!_checkEmail(emailController.text) || _checkPassword(passwordController.text)) {
      return false;
    }
    return true;
  }

  login() {
    // TODO fetch + cache token here
  }
}
