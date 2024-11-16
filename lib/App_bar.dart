import 'package:flutter/material.dart';
import 'loginpage.dart';
import 'menu.dart';
import 'country.dart';
import 'profile.dart';

class FrontPage extends StatefulWidget {
  const  FrontPage({super.key});

  @override
  State<FrontPage> createState() => FrontPageState();

}

class FrontPageState extends State<FrontPage> {
  @override
  Widget build(BuildContext context) {
    double screen_height = MediaQuery.of(context).size.height;
    double screen_width = MediaQuery.of(context).size.width;
    double searchbox_width ;
    if (screen_width > 1000) {
      searchbox_width = screen_width / 1.53;
    } else {
      searchbox_width = screen_width / 1.8;
    }
    print (screen_height);
    print (screen_width);
    return Row(
      //  row start on x axis before the leading in appbar
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        // search box container
        Container(
          width: searchbox_width,
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
        if (screen_width >1000)...[
        SizedBox(width: 50),
        ],
        if (screen_width > 1480)...[
          ElevatedButton(
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
            onPressed: () {
              Navigator.push( // when pressed this push to the login page
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            },
            child: Text('Login ', style: TextStyle(color: Colors.white)),
          ),
          if (screen_width > 1000)...[
          SizedBox(width: 20),
          ]else...[
            SizedBox(width:0)
          ],
          ElevatedButton(

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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Country(),
                ),
              );
            },
            child: Text('India ', style: TextStyle(color: Colors.white)),
          ),
        ],

        // menu icon
        if(screen_width > 1480)...[
          SizedBox(width: 20),
        ]
        else...[
          SizedBox(width:0),
        ],
        IconButton(
          icon: Icon(Icons.menu, color: Colors.green.shade800, size: 36),
          onPressed: () {Navigator.push (
            context,
            MaterialPageRoute (
              builder: (context) => const ProfileView(),
            )
          );
            // Handle menu button press
          },
        ),
      ],
    );
  }

}
