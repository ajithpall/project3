import 'package:flutter/material.dart';
import 'loginpage.dart';
import 'menu.dart';
import 'country.dart';

class FrontPage extends StatefulWidget {
  const FrontPage({super.key});

  @override
  State<FrontPage> createState() => FrontPageState();
}

class FrontPageState extends State<FrontPage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      //  row start on x axis before the leading in appbar
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        // search box container
        Container(
          width: 1050,
          height: 40,
          margin: const EdgeInsets.all(16.0),
          //outer side spacing
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          // inner side
          decoration: BoxDecoration(
            //decoration box
            color: Colors.white, // color of the search box
            borderRadius: BorderRadius.circular(50), // edge curve shape
            boxShadow: [
              // gives shadow effects
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          //search icon
          child: Row(
            children: [
              const Icon(Icons.search, color: Colors.black),
              const SizedBox(width: 8.0),
              const Expanded(
                child: TextField(
                  // input getting widget
                  decoration: InputDecoration(
                    hintText: "SEARCH HERE... ",
                    border: InputBorder.none,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.mic, color: Colors.grey),
                onPressed: () {},
              ),
            ],
          ),
        ),

        //  elevated login button container
        SizedBox(width: 40),
        ElevatedButton(
          onPressed: () {Navigator.push(// when pressed this push to the login page
            context,
            MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ),
          );},
          child: Text('Login ', style: TextStyle(color: Colors.white)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green.shade800,
            // Custom color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            elevation: 5,
            // Add elevation for a 3D effect
            shadowColor: Colors.grey.withOpacity(0.5), // Add shadow
          ),
        ),
        SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {
            Navigator.push (
              context ,
              MaterialPageRoute (
                builder: (context ) =>const Country(),
              ),
            );
          },
          child: Text('India ', style: TextStyle(color: Colors.white)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green.shade800,
            // Custom color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            elevation: 5,
            // Add elevation for a 3D effect
            shadowColor: Colors.grey.withOpacity(0.5), // Add shadow
          ),
        ),

        // menu icon
        SizedBox(width: 20),
        IconButton(
          icon: Icon(Icons.menu, color: Colors.green.shade800, size: 36),
          onPressed: () {Navigator.push (
            context,
            MaterialPageRoute (
              builder: (context) => const MENU(),
            )
          );
            // Handle menu button press
          },
        ),
      ],
    );
  }
}
