import 'package:flutter/material.dart'; // dart package
import 'package:http/http.dart' as http; // http
import 'dart:convert'; // converter change a json data to dart understanding code

class NewUserPage extends StatefulWidget {
const NewUserPage({super.key}); // pass the key to the supper class
@override // method override check
NewUserPageState createState() =>
NewUserPageState(); // create state for state full widget
}

class NewUserPageState extends State<NewUserPage> {
  final TextEditingController nameController =
      TextEditingController(); // textditingcontroller manage the text input
  final TextEditingController emailOrPhoneController =
      TextEditingController(); // store the value to variable
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

// registration function
  Future<void> registerUser() async {
    if (passwordController.text != confirmPasswordController.text) {
      // checks password matching
      ScaffoldMessenger.of(context).showSnackBar(
        //sacffoldmessenger
        const SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }

    final Map<String, String> data = {
      // crate a map named data this store a username, emailor phhone and password
      'username': nameController.text,
      'emailOrPhone': emailOrPhoneController.text,
      'password': passwordController.text,
    };

    try {
      //exceptional error handling
      final response = await http.post(
        // final variable named response , await http.post() perform asynchronous post request using the http package
     //   Uri.parse('http://localhost:3306/root'),
        Uri.parse('http://localhost:56511/'),
        // sending the post request to here
        headers: {'Content-Type': 'application/json'},
        // additional information about the request sent to the server , content type : application /json specifies that the body of the request contains json encoded data this is important information for the server to understand how to interpret the data
        body: jsonEncode(data),// body is the actual data sending to the server
      );// converts the data variabel which is assumed to be a dart object into a json string format

      if (!mounted) return;

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registration successful')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                  'Registration failed: ${jsonDecode(response.body)['message']}')),
        );
      }
    } catch (e) {
      if (!mounted) return;
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
        // background image
        Image.asset(
          'images/signuppage.png',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        // centered container with transparent green
        Center(
          child: Container(
            width: 600,
            height: 600,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.green.shade200.withOpacity(0.8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Name TextField
                TextField(
                 // controller: nameController,
                  decoration: InputDecoration(
                    hintText: 'Full Name',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20), // Spacing

                // Email/Phone TextField
                TextField(controller: emailOrPhoneController,
                  decoration: InputDecoration(
                    hintText: 'Email or Phone',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Password TextField
                TextField(
                 controller: passwordController,
                  obscureText: true, // Hides password
                  decoration: InputDecoration(
                    hintText: 'Password',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Confirm Password TextField
                TextField(
                  controller: confirmPasswordController,
                  obscureText: true, // Hides password
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Register Button (moved inside the container)
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade800,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 15,
                    ),
                  ),
                  onPressed: registerUser,
                  child: const Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
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
