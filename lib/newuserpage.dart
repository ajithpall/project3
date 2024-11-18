// import 'package:flutter/material.dart'; // dart package
// import 'package:http/http.dart' as http; // http
// import 'dart:convert'; // converter change a json data to dart understanding code
// import "dart:io";
//
// class NewUserPage extends StatefulWidget {
// const NewUserPage({super.key}); // pass the key to the supper class
// @override // method override check
// NewUserPageState createState() =>
// NewUserPageState(); // create state for state full widget
// }
//
// class NewUserPageState extends State<NewUserPage> {
//
//   final TextEditingController nameController =
//       TextEditingController(); // textditingcontroller manage the text input
//   final TextEditingController emailOrPhoneController =
//       TextEditingController(); // store the value to variable
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController confirmPasswordController =
//       TextEditingController();
//
//
// // registration function
//   Future<void> registerUser() async {
//     if (passwordController.text != confirmPasswordController.text) {
//       // checks password matching
//       ScaffoldMessenger.of(context).showSnackBar(
//         //sacffoldmessenger
//         const SnackBar(content: Text('Passwords do not match')),
//       );
//       return;
//     }
//
//     final Map<String, String> data = {
//       // crate a map named data this store a username, emailor phhone and password
//       'username': nameController.text,
//       'emailOrPhone': emailOrPhoneController.text,
//       'password': passwordController.text,
//     };
//     final jsonData = jsonEncode(data);
//     print('Original Data: $data');
//     print('JSON Data: $jsonData');
//
//     try {
//       //exceptional error handling
//        const String baseUrl = 'http://localhost:3001/'; // locaon of the runing local host
//       final response = await http.post(
//         // final variable named response , await http.post() perform asynchronous post request using the http package
//      //   Uri.parse('http://localhost:3306/root'),
//         Uri.parse('${baseUrl}data'),
//         // sending the post request to here
//         headers: {'Content-Type': 'application/json'},
//         // additional information about the request sent to the server , content type : application /json specifies that
//         // the body of the request contains json encoded data this is important information for
//         // the server to understand how to interpret the data
//         body: jsonData,// body is the actual data sending to the server
//
//       );// converts the data variabel which is assumed to be a dart object into a json string format
//       if (response.statusCode == 200) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Registration successful')),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//               content: Text(
//                   'Registration failed: ${jsonDecode(response.body)['message']}')),
//         );
//       }
//     } catch (e) {
//       if (!mounted) return;
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error: $e')),
//       );
//     }
//   }
//
// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     body: Stack(
//       children: [
//         // background image
//         Image.asset(
//           'images/signuppage.png',
//           fit: BoxFit.cover,
//           width: double.infinity,
//           height: double.infinity,
//         ),
//         // centered container with transparent green
//         Center(
//           child: Container(
//             width: 600,
//             height: 600,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20.0),
//               color: Colors.green.shade200.withOpacity(0.8),
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 // Name TextField
//                 TextField(
//                   controller: nameController,
//                   decoration: InputDecoration(
//                     hintText: 'Full Name',
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20), // Spacing
//
//                 // Email/Phone TextField
//                 TextField(controller: emailOrPhoneController,
//                   decoration: InputDecoration(
//                     hintText: 'Email or Phone',
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//
//                 // Password TextField
//                 TextField(
//                  controller: passwordController,
//                   obscureText: true, // Hides password
//                   decoration: InputDecoration(
//                     hintText: 'Password',
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//
//                 // Confirm Password TextField
//                 TextField(
//                   controller: confirmPasswordController,
//                   obscureText: true, // Hides password
//                   decoration: InputDecoration(
//                     hintText: 'Confirm Password',
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//
//                 // Register Button (moved inside the container)
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.green.shade800,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(25),
//                     ),
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 40,
//                       vertical: 15,
//                     ),
//                   ),
//                   onPressed: registerUser,
//                   child: const Text(
//                     'Register',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//
//                 ElevatedButton( onPressed: () {
//                   final Map<String,
//                     String> data = {
//                     'username': nameController.text,
//                   'emailOrPhone': emailOrPhoneController.text,
//                   'password': passwordController.text, };
//                 // Print the data to check if it has been entered correctly
//                 print('Username: ${data['username']}');
//                 print('Email or Phone: ${data['emailOrPhone']}');
//                 print('Password: ${data['password']}'); // You can also display a message to the user
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('Data entered: $data')), ); },
//                   child: Text('Submit'), ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }
// }
// for firebase
// import 'package:flutter/material.dart';
// import 'firebase_auth.dart';
//
// class NewUserPage extends StatefulWidget {
//   const NewUserPage({super.key});
//
//   @override
//   NewUserPageState createState() => NewUserPageState();
// }
//
// class NewUserPageState extends State<NewUserPage> {
//   // Controllers to manage user input
//   final TextEditingController emailOrPhoneController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//
//   // Firebase login function
//   Future<void> loginUser() async {
//     final String emailOrPhone = emailOrPhoneController.text;
//     final String password = passwordController.text;
//
//     // Check if fields are filled
//     if (emailOrPhone.isNotEmpty && password.isNotEmpty) {
//       try {
//         // Use Firebase sign-in from firebase_auth.dart
//         await signIn(emailOrPhone, password);
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Login successful')),
//         );
//       } catch (e) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Login failed: $e')),
//         );
//       }
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please fill in all fields')),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Background image
//           Image.asset(
//             'images/loginpage.png',
//             fit: BoxFit.cover,
//             width: double.infinity,
//             height: double.infinity,
//           ),
//           // Centered container with transparent green background
//           Center(
//             child: Container(
//               width: 600,
//               height: 400,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20.0),
//                 color: Colors.green.shade200.withOpacity(0.8),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   // Email/Phone TextField
//                   TextField(
//                     controller: emailOrPhoneController,
//                     decoration: InputDecoration(
//                       hintText: 'Email',
//                       filled: true,
//                       fillColor: Colors.white,
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//
//                   // Password TextField
//                   TextField(
//                     controller: passwordController,
//                     obscureText: true, // Hides password
//                     decoration: InputDecoration(
//                       hintText: 'Password',
//                       filled: true,
//                       fillColor: Colors.white,
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 30),
//
//                   // Login Button
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.green.shade800,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(25),
//                       ),
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 40,
//                         vertical: 15,
//                       ),
//                     ),
//                     onPressed: loginUser,
//                     child: const Text(
//                       'Login',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
import 'package:flutter/material.dart'; // dart package
import 'package:http/http.dart' as http; // http package for API calls
import 'dart:convert'; // JSON data conversion

class NewUserPage extends StatefulWidget {
  const NewUserPage({super.key}); // pass the key to the superclass

  @override // override the createState method
  NewUserPageState createState() => NewUserPageState(); // create state for stateful widget
}

class NewUserPageState extends State<NewUserPage> {
  // Controllers to manage text input
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailOrPhoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  // Registration function
  Future<void> registerUser() async {
    // Check if passwords match
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }

    // Map to store user data
    final Map<String, String> data = {
      'username': nameController.text,
      'password': passwordController.text,
      'emailOrPhone': emailOrPhoneController.text,
    };

    final jsonData = jsonEncode(data); // Encode data as JSON
    print('Original Data: $data'); // Print original data
    print('JSON Data: $jsonData'); // Print JSON data

    try {
      // Send a POST request to the server
      const String baseUrl = 'http://localhost:3001/'; // location of the running local server
      final response = await http.post(
        Uri.parse(baseUrl), // Send the request to the base URL
        headers: {'Content-Type': 'application/json'}, // Set request headers
        body: jsonData, // Send the JSON data as the request body
      );

      if (response.statusCode == 200) {
        // Success: Show a success message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registration successful')),
        );
      } else {
        // Failure: Show an error message from the server
        final responseMessage = jsonDecode(response.body)['message'];
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registration failed: $responseMessage')),
        );
      }
    } catch (e) {
      // Error handling
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Image.asset(
            'images/signuppage.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          // Centered container with a transparent green background
          Center(
            child: Container(
              width: 600, // Set the width of the container
              height: 600, // Set the height of the container
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0), // Rounded corners
                color: Colors.green.shade200.withOpacity(0.8), // Semi-transparent green background
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
                children: [
                  // Name TextField
                  TextField(
                    controller: nameController, // Controller for the name field
                    decoration: InputDecoration(
                      hintText: 'Full Name', // Placeholder text
                      filled: true, // Fill background color
                      fillColor: Colors.white, // White background
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10), // Rounded corners for the border
                      ),
                    ),
                  ),
                  const SizedBox(height: 20), // Spacing between fields

                  // Email/Phone TextField
                  TextField(
                    controller: emailOrPhoneController, // Controller for the email/phone field
                    decoration: InputDecoration(
                      hintText: 'Email or Phone', // Placeholder text
                      filled: true, // Fill background color
                      fillColor: Colors.white, // White background
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10), // Rounded corners for the border
                      ),
                    ),
                  ),
                  const SizedBox(height: 20), // Spacing between fields

                  // Password TextField
                  TextField(
                    controller: passwordController, // Controller for the password field
                    obscureText: true, // Hide the password
                    decoration: InputDecoration(
                      hintText: 'Password', // Placeholder text
                      filled: true, // Fill background color
                      fillColor: Colors.white, // White background
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10), // Rounded corners for the border
                      ),
                    ),
                  ),
                  const SizedBox(height: 20), // Spacing between fields

                  // Confirm Password TextField
                  TextField(
                    controller: confirmPasswordController, // Controller for the confirm password field
                    obscureText: true, // Hide the password
                    decoration: InputDecoration(
                      hintText: 'Confirm Password', // Placeholder text
                      filled: true, // Fill background color
                      fillColor: Colors.white, // White background
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10), // Rounded corners for the border
                      ),
                    ),
                  ),
                  const SizedBox(height: 30), // Spacing between fields

                  // Register Button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade800, // Button color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25), // Rounded corners
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40, // Horizontal padding
                        vertical: 15, // Vertical padding
                      ),
                    ),
                    onPressed: registerUser, // Call the registration function
                    child: const Text(
                      'Register', // Button text
                      style: TextStyle(color: Colors.white), // Text color
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

