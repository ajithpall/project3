// import 'package:http/http.dart' as http; // http package for API calls
// import 'package:flutter/material.dart';
// import 'dart:convert'; // For JSON encoding/decoding
// import 'package:app1/module/userdata.dart'; // Import UserData module
// import 'package:app1/api_end_point/apiendpoint.dart';
// import 'package:app1/route_2/newuserpage.dart';
//
// class API extends NewUserPage {
//   const API({super.key});
// }
// class APIState extends State<NewUserPageState> {
//   // Registration function
//   Future<void> registerUser() async {
//     // Check if passwords match
//     if (UserData.password != UserData.confirmPassword) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Passwords do not match')),
//       );
//       return;
//     }
//
//     // Prepare the JSON data from UserData
//     final jsonData = json.encode({
//       'username': UserData.username,
//       'password': UserData.password,
//       'emailOrPhone': UserData.emailOrPhone,
//     }); // Properly encode the Map into JSON
//
//     print('JSON Data: $jsonData'); // Debug log for JSON data
//
//     try {
//       // Send POST request
//       final response = await http.post(
//         Uri.parse(ApiEndPoints.baseurl), // Parse the URL
//         headers: {'Content-Type': 'application/json'}, // Set headers
//         body: jsonData, // Attach JSON as the body
//       );
//
//       print('Response status: ${response.statusCode}');
//       print('Response body: ${response.body}');
//
//       // Handle response
//       if (response.statusCode == 201) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Registration successful')),
//         );
//       } else {
//         // Handle errors
//         final responseMessage = jsonDecode(response.body)['message'];
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Registration failed: $responseMessage')),
//         );
//       }
//     } catch (e) {
//       // Handle any exceptions
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error: $e')),
//       );
//     }
//   }
// // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold (
//
//     );
//   }
// }


import 'package:http/http.dart' as http; // http package for API calls
import 'package:flutter/material.dart';
import 'dart:convert'; // For JSON encoding/decoding
import 'package:app1/module/userdata.dart'; // Import UserData module
import 'package:app1/api_end_point/apiendpoint.dart';


class API {
  // Accept BuildContext to show SnackBars
  final BuildContext context;

  API(this.context);

  // Registration function
  Future<void> registerUser() async {
    // Check if passwords match
    if (UserData.password != UserData.confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }

    // Prepare the JSON data from UserData
    final jsonData = json.encode({
      'username': UserData.username,
      'password': UserData.password,
      'emailOrPhone': UserData.emailOrPhone,
    });

    print('JSON Data: $jsonData'); // Debug log for JSON data

    try {
      // Send POST request
      final response = await http.post(
        Uri.parse(ApiEndPoints.baseurl), // Parse the URL
        headers: {'Content-Type': 'application/json'}, // Set headers
        body: jsonData, // Attach JSON as the body
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      // Handle response
      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registration successful')),
        );
      } else {
        // Handle errors
        final responseMessage = jsonDecode(response.body)['message'];
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registration failed: $responseMessage')),
        );
      }
    } catch (e) {
      // Handle any exceptions
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }
}