import "package:flutter/material.dart";
import "package:http/http.dart";
import "dart:convert";

class ProfileView extends StatefulWidget{
  const ProfileView ({ super.key });
  @override
  State<ProfileView> createState() => ProfileViewState();
}
class ProfileViewState extends State <ProfileView>{
  @override
  Widget build (BuildContext context ){
    double screen_height = MediaQuery.of(context).size.height;
    double screen_width = MediaQuery.of(context).size.width;
    return Scaffold (
      body : Container(
        height: screen_height ,
        width: screen_width,
        decoration: BoxDecoration (
          color: Colors.green.shade200,
),
        child: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children : [
            Container (
              width: 600,
              height: 600,
              color: Colors.green.shade200.withOpacity(0.8),
            ),
          ],
        ),
      ),
    );
  }
}