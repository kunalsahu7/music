import 'dart:async';

import 'package:flutter/material.dart';

class FlasScreen extends StatefulWidget {
  const FlasScreen({Key? key}) : super(key: key);

  @override
  State<FlasScreen> createState() => _FlasScreenState();
}

class _FlasScreenState extends State<FlasScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(
        seconds: 3,
      ),
          () {
        Navigator.pushReplacementNamed(context, 'bottom_bar');
      },
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Image.asset(
            "Assets/Images/Spotify.png",
            width: 200,
            height: 200,
          ),
        ),
      ),
    );
  }
}