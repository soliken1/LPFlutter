// ignore_for_file: prefer_const_constructors, unused_import, prefer_const_literals_to_create_immutables

import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:listening_party/components/text_field.dart";
import "package:listening_party/components/icon.dart";
import "package:listening_party/components/text.dart";
import "package:listening_party/components/button.dart";
import "package:listening_party/page/login_page.dart";
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import "package:listening_party/page/room_page.dart";
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late User? user;
  late QuerySnapshot querySnapshot;

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 2) {
        FirebaseAuth.instance.signOut();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      }
    });
  }

  Future<QuerySnapshot?> fetchData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('music-room').get();
    return querySnapshot;
  }

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Color(0xFF121212),
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            if (user != null)
              // Custom image icon
              Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: ClipOval(
                  child: Image.network(
                    user?.photoURL ?? "https://i.ibb.co/gz5d0Xc/user.png",
                    width: 38,
                    height: 38,
                  ),
                ),
              ),
            if (user != null)
              // Title text
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  user?.displayName ??
                      user?.email?.substring(0, user?.email!.indexOf('@')) ??
                      'Unknown User',
                  style: TextStyle(color: Colors.white),
                ),
              ),
          ],
        ),
      ),
      body: FutureBuilder<QuerySnapshot?>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Display error message if fetching data fails
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final querySnapshot = snapshot.data!;
            return Row(
              children:
                  querySnapshot.docs.map((DocumentSnapshot documentSnapshot) {
                return Container(
                  width: 200,
                  height: 125,
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            documentSnapshot["room_name"].toString(),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            documentSnapshot["room_desc"].toString(),
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            DateFormat('MM/dd/yyyy hh:mm:ss a').format(
                              (documentSnapshot["room_created"] as Timestamp)
                                  .toDate(),
                            ),
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF121212),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
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
            label: "Logout",
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
