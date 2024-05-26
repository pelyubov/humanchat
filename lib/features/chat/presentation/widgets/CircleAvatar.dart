import 'package:flutter/material.dart';

class CircularAvatarButton extends StatelessWidget {
  final String imagePath;
  final VoidCallback onPressed;

  const CircularAvatarButton({
    super.key,
    required this.imagePath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: CircleAvatar(
        child: imagePath.isNotEmpty ? Image.network(imagePath) : const Icon(Icons.person),
      ),
    );
  }
}
