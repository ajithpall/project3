import 'package:flutter/material.dart';
import 'package:app1/App_bar.dart';
import 'package:app1/body.dart';
//import 'dart:convert/convert.dart';
//import 'package:mysql1/mysql1.dart';
//import 'dart:io';
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
  runApp( const firstapp());
  //dart database connection but fail this process
  // The mysql1 package relies on dart:io, which is
  // unavailable in Flutter for Web. Instead, Flutter
  // web uses dart:html, which doesn't support raw socket
  // connections.
  // try {
  //   var settings = ConnectionSettings(
  //     host: 'localhost',
  //     port: 3306,
  //     user: 'root',
  //     password: 'Lemeniz@pass1',
  //     db: 'user_profile',
  //   );
  //
  //   var connection = await MySqlConnection.connect(settings);
  //   print('Connected to MySQL database!');
  //
  //   // Insert the value to the database
  //   await connection.query('''
  //   INSERT INTO User (username, password, emailOrPhone, profilePhoto, address)
  //   VALUES (?, ?, ?, ?, ?)
  // ''', [
  //     'john_doe',
  //     'hashed_password',
  //     'john@example.com',
  //     'path/to/photo.jpg',
  //     '123 Main St, Anytown, USA'
  //   ]);
  //   print('Sample user inserted.');

    // Fetch and print values from the database
    // var results = await connection.query('SELECT * FROM User');
    // for (var row in results) {
    //   print(
    //       'ID: ${row['ID']}, Username: ${row['username']}, Email/Phone: ${row['emailOrPhone']}, Address: ${row['address']}');
    //}

//     await connection.close();
//   } catch (e) {
//     print('An error occurred: $e');
//   }
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
