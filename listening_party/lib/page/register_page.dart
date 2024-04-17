// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import "package:flutter/material.dart";
import "package:listening_party/components/text_field.dart";
import "package:listening_party/components/icon.dart";
import "package:listening_party/components/text.dart";
import "package:listening_party/components/button.dart";
import 'package:listening_party/page/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Phone Icon
              CustomIcon(
                  icon: Icons.phone_android,
                  iconSize: 100,
                  iconColor: Colors.white),
              SizedBox(height: 10),

              //Application Name Header
              CustomText(
                  text: "Listening Party", fontSize: 24, color: Colors.white),
              SizedBox(height: 25),

              //Login Subheader
              CustomText(text: "Register", fontSize: 18, color: Colors.white),
              SizedBox(height: 20),

              CustomTextField(
                  labelText: "Email", hintText: "myemail@email.com"),
              SizedBox(height: 15),

              //Password Text Field
              CustomTextField(
                  labelText: "Password", hintText: "", obscureText: true),
              SizedBox(height: 15),

              //Register Via Email Button
              CustomButton(
                text: "Register Via Email",
                bgColor: Color(0xFF7834f7),
                textColor: Colors.white,
                paddingHorizontal: 100,
                paddingVertical: 12,
                margin: 0.0,
              ),
              SizedBox(height: 20),

              //Register Via Google Button
              CustomButton(
                text: "Register Via Email",
                bgColor: Color(0xfff1432c),
                textColor: Colors.white,
                paddingHorizontal: 100,
                paddingVertical: 12,
                margin: 0.0,
              ),
              SizedBox(height: 20),

              //Login Redirect Text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                      text: "Already Have an Account?",
                      fontSize: 14,
                      color: Colors.white),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => LoginPage(),
                        ),
                      );
                    },
                    child: CustomText(
                        text: " Login Here", fontSize: 14, color: Colors.red),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
