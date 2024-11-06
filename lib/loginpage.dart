import 'package:flutter/material.dart';
class LoginPage extends StatefulWidget {
  const LoginPage ( { super.key});
  @override
  State<LoginPage> createState() => LoginPageState();
}
class LoginPageState extends State<LoginPage>{
  @override
  Widget build ( BuildContext context ){
    return  Container (
      width: 600,
      height : 600,
      color: Colors.green.shade800,
    );
  }
}