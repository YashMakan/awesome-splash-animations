import 'package:five_splash_screen/painters/netflix/netflix_animation.dart';
import 'package:five_splash_screen/painters/pinterest/pinterest_animation.dart';
import 'package:five_splash_screen/painters/uber/uber_animation.dart';
import 'package:five_splash_screen/painters/youtube/youtube_animation.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: NetflixAnimation(),
      ),
    );
  }
}
