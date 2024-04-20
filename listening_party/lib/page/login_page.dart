// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:listening_party/components/text_field.dart";
import "package:listening_party/components/icon.dart";
import "package:listening_party/components/text.dart";
import "package:listening_party/components/button.dart";
import "package:listening_party/page/auth.dart";
import 'package:listening_party/page/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  checkAuth(BuildContext context, {bool isGoogleSignIn = false}) {
    if (isGoogleSignIn) {
      googleSignIn().then((_) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => Auth(),
          ),
        );
      });
    } else {
      signIn().then((_) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => Auth(),
          ),
        );
      });
    }
  }

  Future<void> signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      print('User signed in successfully');
    } catch (e) {
      print('Error signing in: $e');
    }
  }

  Future<void> googleSignIn() async {
    try {
      await FirebaseAuth.instance.signInWithPopup(
        GoogleAuthProvider(),
      );
      print('User signed in successfully');
    } catch (e) {
      print('Error signing in: $e');
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
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
                CustomText(text: "Login", fontSize: 18, color: Colors.white),
                SizedBox(height: 20),

                //Email Text Field
                CustomTextField(
                  labelText: "Email",
                  hintText: "myemail@email.com",
                  controller: _emailController,
                ),
                SizedBox(height: 15),

                //Password Text Field
                CustomTextField(
                  labelText: "Password",
                  hintText: "",
                  obscureText: true,
                  controller: _passwordController,
                ),
                SizedBox(height: 15),

                //Login Via Email Button
                CustomButton(
                  text: "Login Via Email",
                  bgColor: Color(0xFF7834f7),
                  textColor: Colors.white,
                  paddingHorizontal: 45,
                  paddingVertical: 12,
                  margin: 0.0,
                  onPressed: () => checkAuth(context),
                ),
                SizedBox(height: 20),

                //Login Via Google Button
                CustomButton(
                  text: "Login Via Gmail",
                  bgColor: Color(0xfff1432c),
                  textColor: Colors.white,
                  paddingHorizontal: 45,
                  paddingVertical: 12,
                  margin: 0.0,
                  onPressed: () => checkAuth(context, isGoogleSignIn: true),
                ),

                SizedBox(height: 20),

                //Register Redirect Text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                        text: "No Account?", fontSize: 14, color: Colors.white),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => RegisterPage(),
                          ),
                        );
                      },
                      child: CustomText(
                        text: " Register Here",
                        fontSize: 14,
                        color: Colors.red,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
