import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body : Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset('images/signuppage.png', fit: BoxFit.cover),
          ),
          Positioned(
            top: 100,
            left: 400,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.green.shade800.withOpacity(0.7),
              ),
              child: const SizedBox(
                width: 800,
                height: 600,
              ),
            ),
          ),
          // user name box
          Positioned(
            top: 250,
            left: 450,
            child: SizedBox (
              height: 50,
              width: 400,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white,
              ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Icon(
                        Icons.account_circle,
                        color: Colors.green.shade800,
                      ),
                    ),
                    Expanded (
                      child: TextField(
                        decoration: InputDecoration (
                          hintText: 'username or email ',
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            fontSize: 20.0 , // adjust the font size of the hint
                            fontWeight: FontWeight.normal,
                            color: Colors.green.shade800,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // password box
          Positioned(
            top: 350,
            left: 450,
            child: SizedBox (
              height: 50,
              width: 400,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(5),
                      child: Icon (
                        Icons.visibility,
                      )
                    ),
                    Expanded (
                      child: TextField(
                        decoration: InputDecoration (
                          hintText: 'password  ',
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            fontSize: 20.0 , // adjust the font size of the hint
                            fontWeight: FontWeight.normal,
                            color: Colors.green.shade800,

                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // signup icon
          Positioned (
            top : 500,
              left: 590,
            child:  ElevatedButton (
              onPressed: (){
                // write code here
              },
              child: Text('SingUp', style: TextStyle(color: Colors.white)),
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
          ),
        ],
      ),
    );
  }
}
