import 'package:flutter/material.dart';
import 'package:app1/home/App_bar.dart';
import 'package:app1/home/body.dart';
//import 'newuserpage.dart';
//import 'dart:convert/convert.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'firebase_auth.dart';

//init run
void main()  async {
  // firebase backend
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
// options: const FirebaseOptions(
// apiKey: "AIzaSyCaN0R-GefeoWRo850tkhSXSzFzdrbqyKQ",
// projectId: "project0-b671c",
// messagingSenderId: "181252863513",
// appId: "1:181252863513:web:9e96f33e177e62c5405c88"
// )
// );
  runApp( const
 firstapp()
 // NewUserPage()

  );
}

// stateless class for firstapp
class firstapp extends StatelessWidget {
  const firstapp({super.key});

  @override
  Widget build(BuildContext context)  {
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
            title:
              const  FrontPage(),
            flexibleSpace: Container (
              decoration: BoxDecoration (
                gradient: LinearGradient (
                  colors: [Colors.green.shade300, Colors.green.shade200],
                  begin: Alignment.topCenter ,
                  end: Alignment.bottomCenter ,
                ),
              ),
            ),
          ),
        ),
        body: const bodyone(),
      ),
    );
  }
}
