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
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: AppBar(
            leading:  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('images/logo.jpeg',
                width: 10,
                height: 10,
                fit: BoxFit.contain,
                  ),
            ), // Place your logo here
            title: const FrontPage(),
            flexibleSpace: Container (
              decoration: BoxDecoration (
                gradient: LinearGradient (
                  colors: [Colors.green.shade300, Colors.green.shade200],
                  begin: Alignment.topCenter ,
                  end: Alignment.bottomCenter ,
                )
              )
            )
          ),
        ),
        body: const bodyone(),
      ),
    );
  }
}
