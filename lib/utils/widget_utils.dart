import 'package:flutter/material.dart';

class UFlex extends StatelessWidget {
  final Widget child;
  final int flex;
  const UFlex({super.key, required this.flex, required this.child});

  @override
  Widget build(BuildContext context) {
    return Expanded(flex: 1, child: child);
  }
}

class URight extends StatelessWidget {
  final Widget child;
  const URight({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Row(children: [Expanded(child: Container()), child]);
  }
}

class ULeft extends StatelessWidget {
  final Widget child;
  const ULeft({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Row(children: [child, Expanded(child: Container())]);
  }
}
