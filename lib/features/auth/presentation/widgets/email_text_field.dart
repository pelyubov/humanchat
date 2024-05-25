import 'package:flutter/material.dart';
import 'package:humanchat/common/languages.dart';

class EmailTextField extends StatelessWidget {
  EmailTextField(
      {super.key, required this.controller, required this.email, this.isValid, this.isEmailExist});
  final TextEditingController controller;
  final String email;
  bool? isValid;
  bool? isEmailExist;

  Color getColor() {
    if (isValid == null && isEmailExist == null) return Colors.black;
    if (!isValid! || !isEmailExist!) return Colors.red;
    if (isValid! && isEmailExist!) return Colors.green;
    return Colors.black;
  }

  String? _getErrorText() {
    if (isValid == true) return Languages.invalidEmail;
    if (isEmailExist == true) return Languages.wrongEmail;
    return null;
  }

  String get emailText => email.isNotEmpty ? email : controller.text;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: getColor(),
              width: 2,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          labelText: 'Email',
          errorText: _getErrorText(),
          prefixIcon: Icon(
            Icons.email,
            color: getColor(),
          ),
        ),
        style: TextStyle(color: getColor()),
        // autofocus: true,
        autocorrect: false,
        keyboardType: TextInputType.emailAddress,
      ),
      // if (failure != null) Text(failure!.errorMessage, style: const TextStyle(color: Colors.red)),
    ]);
  }
}
