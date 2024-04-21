// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import "package:flutter/material.dart";
import "package:listening_party/components/text_field.dart";
import "package:listening_party/components/icon.dart";
import "package:listening_party/components/text.dart";
import "package:listening_party/components/button.dart";
import 'package:listening_party/page/login_page.dart';
import 'package:listening_party/page/home_page.dart';
import "package:firebase_auth/firebase_auth.dart";

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<RegisterPage> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  String? _errorMessage;
  bool _isAuthenticated = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  Future<void> signUp(BuildContext context) async {
    setState(() {
      _errorMessage = null;
    });

    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    // Check if email and password are not empty
    if (email.isEmpty || password.isEmpty) {
      setState(() {
        _errorMessage = 'Please enter both email and password.';
      });
      return;
    }

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      setState(() {
        _isAuthenticated = true;
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        // Handle specific Firebase Authentication errors
        if (e.code == 'user-not-found') {
          _errorMessage = 'No user found with that email.';
        } else if (e.code == 'wrong-password') {
          _errorMessage = 'Wrong password provided for that user.';
        } else if (e.code == 'invalid-email') {
          _errorMessage = 'The email address provided is not valid.';
        } else if (e.code == 'email-already-in-use') {
          _errorMessage = 'The email address is already in use.';
        } else if (e.code == 'weak-password') {
          _errorMessage = 'The password is too weak.';
        } else {
          _errorMessage = 'An error occurred: ${e.message}';
        }
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'An unexpected error occurred.';
      });
    }
  }

  Future<void> googleSignUp(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithPopup(
        GoogleAuthProvider(),
      );
      setState(() {
        _isAuthenticated = true;
      });
    } catch (e) {
      _errorMessage = 'Error signing in: $e';
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
    if (_isAuthenticated) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      );
    }
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

              if (_errorMessage != null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _errorMessage!,
                    style: TextStyle(color: Colors.red),
                  ),
                ),

              //Register Via Email Button
              CustomButton(
                text: "Register Via Email",
                bgColor: Color(0xFF7834f7),
                textColor: Colors.white,
                paddingHorizontal: 45,
                paddingVertical: 12,
                margin: 0.0,
                onPressed: () =>
                    signUp(context), // Pass a callback function here
              ),

              SizedBox(height: 20),

              //Register Via Google Button
              CustomButton(
                text: "Register Via Gmail",
                bgColor: Color(0xfff1432c),
                textColor: Colors.white,
                paddingHorizontal: 45,
                paddingVertical: 12,
                margin: 0.0,
                onPressed: () =>
                    googleSignUp(context), // Pass a callback function here
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
