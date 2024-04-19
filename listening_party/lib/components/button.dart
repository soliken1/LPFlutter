// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color textColor;
  final double paddingHorizontal;
  final double paddingVertical;
  final double margin;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.bgColor,
    required this.paddingHorizontal,
    required this.paddingVertical,
    required this.margin,
    required this.textColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: margin),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
        ),
        onPressed: onPressed,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: paddingHorizontal,
            vertical: paddingVertical,
          ),
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
