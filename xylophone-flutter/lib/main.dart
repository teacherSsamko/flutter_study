import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int soundNumber) {
    final player = AudioCache();
    player.play('note$soundNumber.wav');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(children: [
            Container(
              child: TextButton(
                onPressed: () {
                  playSound(1);
                },
              ),
              color: Colors.red,
            ),
            Container(
              child: TextButton(
                onPressed: () {
                  playSound(2);
                },
              ),
              color: Colors.orange,
            ),
            Container(
              child: TextButton(
                onPressed: () {
                  playSound(3);
                },
              ),
              color: Colors.yellow,
            ),
            Container(
              child: TextButton(
                onPressed: () {
                  playSound(4);
                },
              ),
              color: Colors.green,
            ),
            Container(
              child: TextButton(
                onPressed: () {
                  playSound(5);
                },
              ),
              color: Colors.teal,
            ),
            Container(
              child: TextButton(
                onPressed: () {
                  playSound(6);
                },
              ),
              color: Colors.blue,
            ),
            Container(
              child: TextButton(
                onPressed: () {
                  playSound(7);
                },
              ),
              color: Colors.purple,
            ),
          ]),
        ),
      ),
    );
  }
}
