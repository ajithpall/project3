import 'package:flutter/material.dart';
class Country extends StatefulWidget {
  const Country ( { super.key});
  @override
  State<Country> createState() => CountryState();
}
class CountryState extends State<Country>{
  @override
  Widget build ( BuildContext context ){
    return  Container (
      width: 600,
      height : 600,
      color: Colors.red.shade800,
    );
  }
}