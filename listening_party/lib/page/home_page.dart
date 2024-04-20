// ignore_for_file: prefer_const_constructors, unused_import, prefer_const_literals_to_create_immutables

import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:listening_party/components/text_field.dart";
import "package:listening_party/components/icon.dart";
import "package:listening_party/components/text.dart";
import "package:listening_party/components/button.dart";
import 'dart:math';

import "package:listening_party/page/room_page.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Color(0xFF121212),
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            // Custom image icon
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: ClipOval(
                child: Image.asset(
                  'assets/pfp.jpg',
                  width: 38,
                  height: 38,
                ),
              ),
            ),
            // Title text
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "Soliken",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemBuilder: (_, index) {
          return Container(
            color: randomColor(),
            width: 500,
            height: 500,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => RoomPage(),
                  ),
                );
              },
              child: CustomText(
                  text: " Select Room", fontSize: 14, color: Colors.red),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF121212),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            label: "Exit",
          ),
        ],
      ),
    );
  }
}

Color randomColor() {
  // Generate random values for RGB channels
  final random = Random();
  final r = random.nextInt(256);
  final g = random.nextInt(256);
  final b = random.nextInt(256);

  // Return a Color object with the generated RGB values
  return Color.fromARGB(255, r, g, b);
}
