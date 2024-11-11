import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';

class newuserpage extends StatelessWidget {
  const newuserpage({super.key});
// contollers to manage text inputs
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailOrPhoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  // Function to register user
  Future<void> registerUser(BuildContext context) async {
    if (passwordController.text != confirmPasswordController.text) {
      // Show error if passwords do not match
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }

    // Data to send to backend
    final Map<String, String> data = {
      'username': nameController.text,
      'emailOrPhone': emailOrPhoneController.text,
      'password': passwordController.text,
    };

    // Send POST request to backend
    final response = await http.post(
      Uri.parse('http://localhost:3000/register'), // Update with your server URL
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      // Registration success
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registration successful')),
      );
      // Optionally, navigate to another screen
    } else {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registration failed: ${jsonDecode(response.body)['message']}')),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //background image
          Image.asset(
            'images/signuppage.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          //centered container with transparent green
          Center(
            child: Container(
              width: 600,
              height: 600,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.green.shade200.withOpacity(0.8),
              ),
            ),
          ),
          Positioned(
            top: 600,
            left: 700,
            child: ElevatedButton(
              onPressed: () => registerUser(context),
              child: const Text('Register',
                  style: TextStyle(color: Colors.white),
              ),
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
          Positioned(// name box
            top: 100,
            left: 550,
            child: SizedBox(
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
                    Expanded(
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          hintText: 'USER NAME',
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            fontSize: 20.0, // adjust the font size of the hint
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
          // email id or phone number
          Positioned(
            top: 200,
            left: 550,
            child: SizedBox(
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
                        Icons.email_outlined,
                        color: Colors.green.shade800,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: emailOrPhoneController,
                        decoration: InputDecoration(
                          hintText: 'PHONE OR EMAIL',
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            fontSize: 20.0, // adjust the font size of the hint
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
          // PASSWORD
          Positioned(
            top: 300,
            left: 550,
            child: SizedBox(
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
                        Icons.visibility,
                        color: Colors.green.shade800,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          hintText: 'PASSWORD',
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            fontSize: 20.0, // adjust the font size of the hint
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
          //confirm password
          Positioned(// name box
            top: 400,
            left: 550,
            child: SizedBox(
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
                        Icons.visibility_off,
                        color: Colors.green.shade800,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: confirmPasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'CONFIRM PASSWORD',
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            fontSize: 20.0, // adjust the font size of the hint
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
        ],
      ),
    );
  }
}

