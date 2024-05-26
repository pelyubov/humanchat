import 'package:flutter/material.dart';
import 'package:humanchat/common/languages.dart';

enum EmailState {
  initial,
  valid,
  invalid,
  notExist,
}

class EmailTextField extends StatelessWidget {
  EmailTextField({super.key, required this.controller, required this.emailState});
  final TextEditingController controller;
  final EmailState emailState;

  static const _colors = {
    EmailState.initial: Colors.black,
    EmailState.valid: Colors.green,
    EmailState.invalid: Colors.red,
    EmailState.notExist: Colors.redAccent,
  };

  Color getColor() {
    return _colors[emailState] ?? _colors[EmailState.initial]!;
  }

  final _textMessages = {
    EmailState.initial: null,
    EmailState.valid: null,
    EmailState.invalid: Languages.invalidEmail,
    EmailState.notExist: Languages.wrongEmail,
  };

  String? _getErrorText() {
    return _textMessages[emailState];
  }

  String get emailText => controller.text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
      ],
    );
  }
}
