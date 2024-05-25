import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  const SubmitButton({super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        minimumSize: const Size(double.infinity, 50),
        textStyle: const TextStyle(fontSize: 16),
        padding: const EdgeInsets.all(16),
      ),
      child: Text(text),
    );
  }
}
