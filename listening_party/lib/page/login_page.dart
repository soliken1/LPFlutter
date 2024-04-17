// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import "package:flutter/material.dart";

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF121212),
        body: SafeArea(
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              //Icon
              Icon(
                Icons.phone_android,
                size: 100,
                color: Colors.white,
              ),

              SizedBox(height: 25),

              //Listening Party Header
              Text(
                "Listening Party",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //Login Header
              Text(
                "Login",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 20,
              ),

              //TextField Email
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF121212),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "myemail@email.com",
                      hintStyle: TextStyle(color: Colors.grey),
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: EdgeInsets.only(left: 20.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),

              //TextField Password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF121212),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    obscureText: true,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "",
                      hintStyle: TextStyle(color: Colors.grey),
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: EdgeInsets.only(left: 20.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),

              //Button Via Email
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 120.0),
                child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Color(0xFF7834f7),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Text(
                      'Login Via Email',
                      style: TextStyle(color: Colors.white),
                    ))),
              ),
              SizedBox(
                height: 20,
              ),

              //Button Via Google
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 120.0),
                child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Color(0xfff1432c),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Text(
                      'Login Via Google',
                      style: TextStyle(color: Colors.white),
                    ))),
              ),
              SizedBox(
                height: 20,
              ),

              //Register Redirect
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "No Account?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    " Register Here",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  )
                ],
              )
            ]),
          ),
        ));
  }
}
