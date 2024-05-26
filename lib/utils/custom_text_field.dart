import 'package:flutter/material.dart';

class CustomTextField<E extends Enum> extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.labelText,
    this.keyboardType,
    required this.controller,
    required this.states,
    required this.colors,
    required this.errorMessages,
    this.prefixIcon,
  });
  final String labelText;
  final TextInputType? keyboardType;
  final Icon? prefixIcon;
  final TextEditingController controller;
  final E states;
  final Map<E, Colors> colors;
  final Map<E, String?> errorMessages;

  get _getColor => colors[states] ?? Colors.black;

  String? _getErrorText() {
    return errorMessages[states];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: _getColor(),
                width: 2,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            labelText: labelText,
            errorText: _getErrorText(),
            prefixIcon: Icon(
              prefixIcon?.icon,
              color: _getColor(),
            ),
          ),
          style: TextStyle(color: _getColor()),
          // autofocus: true,
          autocorrect: false,
          keyboardType: keyboardType,
        ),
      ],
    );
  }
}
