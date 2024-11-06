/*
import 'package:flutter/material.dart';
import 'package:app1/App_bar.dart';
import 'package:app1/body.dart';

void main() {
  runApp(const firstapp());
}

class firstapp extends StatelessWidget {
  const firstapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-com',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        body: Column(
          children: [
            const FrontPage(), // Use FrontPage as a custom AppBar
            const Expanded(child: bodyone()),
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';

class FrontPage extends StatelessWidget {
  const FrontPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0), // Ensure no side padding
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.green.shade300, Colors.green.shade500],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      height: kToolbarHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "Your Title Here",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}*/
