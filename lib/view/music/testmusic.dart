import 'package:flutter/material.dart';

class TestMusicPlayer extends StatefulWidget {
  const TestMusicPlayer({super.key});

  @override
  State<TestMusicPlayer> createState() => _TestMusicPlayerState();
}

class _TestMusicPlayerState extends State<TestMusicPlayer> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(children: []),
      )),
    );
  }
}
