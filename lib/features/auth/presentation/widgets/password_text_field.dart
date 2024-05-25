import 'package:flutter/material.dart';
import 'package:humanchat/common/languages.dart';

class PasswordObj {
  late String password;
  late bool Function() isValidPassword;
  late bool Function() checkPassword;
}

class PasswordTextField extends StatefulWidget {
  final PasswordObj passwordObj;
  final String? labelText;
  const PasswordTextField({super.key, this.labelText, required this.passwordObj});

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  final TextEditingController controller = TextEditingController(text: '');
  bool? isValid;
  bool? isWrong;

  Color getColor() {
    if (isValid == null && isWrong == null) return Colors.black;
    if (!isValid! || !isWrong!) return Colors.red;
    if (isValid! && isWrong!) return Colors.green;
    return Colors.black;
  }

  @override
  void initState() {
    super.initState();
    widget.passwordObj.password = password;
    widget.passwordObj.isValidPassword = _isValidPassword;
    widget.passwordObj.checkPassword = checkPassword;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  String? _getErrorText() {
    if (isValid == true) return Languages.invalidPassword;
    if (isWrong == true) return Languages.wrongPassword;
    return null;
  }

  String get password => controller.text;

  bool _isValidPassword() {
    return RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)[A-Za-z\d]{8,}$').hasMatch(password);
  }

  bool checkPassword() {
    if (!_isValidPassword()) {
      setState(() {
        isValid = false;
      });
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: widget.labelText ?? Languages.password,
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
