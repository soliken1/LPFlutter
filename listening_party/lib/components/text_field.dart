// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;

  const CustomTextField({
    super.key,
    required this.labelText,
    this.hintText = '',
    this.obscureText = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        width: 450,
        decoration: BoxDecoration(
          color: Color(0xFF121212),
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey),
            labelStyle: TextStyle(color: Colors.white),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding: EdgeInsets.only(left: 20.0),
          ),
        ),
      ),
    );
  }
}
