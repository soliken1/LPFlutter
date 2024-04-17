import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final Color iconColor;

  const CustomIcon(
      {super.key,
      required this.icon,
      required this.iconSize,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: iconSize,
          color: iconColor,
        ),
      ],
    );
  }
}
