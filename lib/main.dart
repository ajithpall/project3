import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:app1/App_bar.dart';
import 'package:app1/body.dart';

//init run
void main() {
  runApp(const firstapp());
}

// stateless class for firstapp
class firstapp extends StatelessWidget {
  const firstapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-com',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home:  Scaffold (
        appBar: AppBar (
          title: const  FrontPage(),
        ),
        body:  const bodyone(),
      ),
    );
  }
}

