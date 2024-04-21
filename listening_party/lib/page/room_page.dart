// ignore_for_file: prefer_const_constructors, unused_import, prefer_const_literals_to_create_immutables

import 'dart:io';
import "package:flutter/material.dart";
import "package:listening_party/components/text_field.dart";
import "package:listening_party/components/icon.dart";
import "package:listening_party/components/text.dart";
import "package:listening_party/components/button.dart";
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import "package:firebase_auth/firebase_auth.dart";
import 'package:flutter/foundation.dart';

class RoomPage extends StatefulWidget {
  const RoomPage({super.key});

  @override
  State<RoomPage> createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  final _messageController = TextEditingController();

  void handleSendMessage() {
    print('Message sent');
  }

  final _youtubeController = YoutubePlayerController.fromVideoId(
    videoId: "LVO_zS1qWqs",
    autoPlay: false,
    params: const YoutubePlayerParams(showFullscreenButton: true),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      body: Column(
        children: [
          YoutubePlayer(
            controller: _youtubeController,
            aspectRatio: 16 / 9,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    labelText: "",
                    hintText: "Send A Message",
                    controller: _messageController,
                  ),
                ),
                SizedBox(width: 8.0),
                CustomButton(
                  text: "Send",
                  bgColor: Colors.purple,
                  paddingHorizontal: 10,
                  paddingVertical: 10,
                  margin: 0,
                  textColor: Colors.white,
                  onPressed: handleSendMessage,
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Stack(
        children: [
          Positioned(
            bottom: 16.0 + MediaQuery.of(context).padding.bottom,
            right: 16.0,
            child: FloatingActionButton(
              backgroundColor: Colors.red,
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {
                print("Pressed The Button!");
              },
            ),
          ),
        ],
      ),
    );
  }
}
