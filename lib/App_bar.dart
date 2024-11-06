import 'package:flutter/material.dart';
import 'package:app1/body.dart';
class FrontPage extends StatefulWidget {
  const FrontPage({super.key });
  @ override
  State<FrontPage> createState() => FrontPageState();
}
class FrontPageState extends State<FrontPage>{
  @override
  Widget build ( BuildContext context ){
    return AppBar(
      backgroundColor: Colors.green.shade300,

       /* flexibleSpace: FlexibleSpaceBar(
         background:
      Container(
          decoration: BoxDecoration(
            gradient: LinearGradient (
               colors: [Colors.green.shade300 , Colors.green.shade200 ],
                stops:[0.0,0.5,1.0],// color transition flow
                begin: Alignment.topRight,
                end : Alignment.bottomLeft,
              ),
           ),
         ),
        ),
        elevation: 0.0,*/
    );
  }
}