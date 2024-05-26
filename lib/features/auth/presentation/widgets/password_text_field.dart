import 'package:flutter/material.dart';
import 'package:humanchat/common/languages.dart';

enum PasswordState {
  initial,
  valid,
  invalid,
}

class PasswordTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText;
  final bool? isValid;
  final bool? isWrong;

  const PasswordTextField(
      {super.key, this.labelText, this.isValid, this.isWrong, required this.controller});

  Color getColor() {
    if (isValid == null && isWrong == null) return Colors.black;
    if (!isValid! || !isWrong!) return Colors.red;
    if (isValid! && isWrong!) return Colors.green;
    return Colors.black;
  }

  String? _getErrorText() {
    if (isValid == true) return Languages.invalidPassword;
    if (isWrong == true) return Languages.wrongPassword;
    return null;
  }

  String get password => controller.text;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText ?? Languages.password,
        errorText: _getErrorText(),
        prefixIcon: Icon(
          Icons.password,
          color: getColor(),
        ),
      ),
      style: const TextStyle(color: Colors.black),
      obscureText: true,
      autocorrect: false,
      keyboardType: TextInputType.visiblePassword,
    );
  }
}
