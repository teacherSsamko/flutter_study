import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("I am Poor"),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Image(
          image: AssetImage("images/flame1.png"),
        ),
      ),
      backgroundColor: Colors.amberAccent[100],
    ),
    debugShowCheckedModeBanner: false,
  ));
}
