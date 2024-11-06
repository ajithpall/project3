import 'package:flutter/material.dart';
class MENU extends StatefulWidget {
  const MENU ( { super.key});
  @override
  State<MENU> createState() => MENUState();
}
class MENUState extends State<MENU>{
  @override
  Widget build ( BuildContext context ){
    return  Container (
      width: 600,
      height : 600,
      color: Colors.yellow .shade800,
    );
  }
}