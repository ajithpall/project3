import 'package:flutter/material.dart';
import 'App_bar.dart';

class bodyone extends StatefulWidget {
  const bodyone({super.key});

  @override
  State<bodyone> createState() => bodyoneState();
}

class bodyoneState extends State<bodyone> {
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 600,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.green.shade100, Colors.green.shade50],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
             ),
          ],// children
        ),
    );
  }
}
