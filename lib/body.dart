import 'package:flutter/material.dart';

//import 'slider.dart'; // Commented for debugging slider widget
import 'demoslider.dart'; // Assuming this is another widget you have created

class bodyone extends StatefulWidget {
  const bodyone({super.key});

  @override
  State<bodyone> createState() => bodyoneState();
}

class bodyoneState extends State<bodyone> {
  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    double screen_width = MediaQuery.of(context).size.width;
    double screen_height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Stack(
        children: [
          // Background with gradient
          Container(
            height: screen_height * 2, // height of the page
            width: screen_width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.green.shade200, // Start with a light green
                  Colors.green.shade50,  // Switch to an even lighter shade
                  Colors.green.shade200  // End back to light green
                ],
                begin: Alignment.topCenter, // Gradient begins at the top
                end: Alignment.bottomCenter, // Ends at the bottom
                stops: const [0.2, 0.5, 0.8], // Gradient distribution percentages
              ),
            ),
          ),
      // Second app bar for quick settings access
      Positioned(
        top: 0,
        left: 0,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white, // White background
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // Semi-transparent shadow
                  spreadRadius: 5, // Extends the shadow outward
                  blurRadius: 7, // Smoothens the edges of the shadow
                  offset: const Offset(0, 3), // Offsets shadow along x and y
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Evenly spaced menu items
              crossAxisAlignment: CrossAxisAlignment.center, // Align items vertically
              children: [
                _buildMenuItem('About'),
                _buildMenuItem('Cart'),
                _buildMenuItem('Gift Card'),
                _buildMenuItem('Become a Seller'),
              ],
            ),
          ),
        ),
      ),
          // Horizontal scrolling category menu
          Positioned(
            top: 51, // Positioned just below the second app bar
            left: 0,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal, // Horizontal scrolling enabled
              child: Container(

                height: 150, // Height for the category menu container
                decoration: BoxDecoration(
                  color: Colors.white, // White background for contrast
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // Soft shadow
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  // Items for horizontal scrolling
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(width: 100), // Space before first menu item
                    _buildMenuItem(
                      'Home Appliances',
                      imagePath: 'images/appliances.png', // Path to the image
                      imageHeight: 100, // Image height
                      imageWidth: 100, // Image width
                    ),
                    const SizedBox(width: 100), // Space between menu items
                    _buildMenuItem(
                      'Electronics',
                      imagePath: 'images/appliances.png',
                      imageHeight: 100,
                      imageWidth: 100,
                    ),
                    const SizedBox(width: 100),
                    _buildMenuItem(
                      'Toys',
                      imagePath: 'images/toys.jpeg',
                      imageHeight: 100,
                      imageWidth: 100,
                    ),
                    const SizedBox(width: 100),
                    _buildMenuItem(
                      'Mobiles',
                      imagePath: 'images/mobile.png',
                      imageHeight: 100,
                      imageWidth: 100,
                    ),
                    const SizedBox(width: 100),
                    _buildMenuItem(
                      'Fashion',
                      imagePath: 'images/fashion.png',
                      imageHeight: 100,
                      imageWidth: 100,
                    ),
                    const SizedBox(width: 100),
                    _buildMenuItem(
                      'Grocery',
                      imagePath: 'images/grocery.png',
                      imageHeight: 100,
                      imageWidth: 100,
                    ),
                    const SizedBox(width: 100),
              _buildMenuItem(
                'Grocery',
                imagePath: 'images/grocery.png',
                imageHeight: 100,
                imageWidth: 100,
              ),
                    const SizedBox(width: 100),
                    _buildMenuItem(
                      'Grocery',
                      imagePath: 'images/grocery.png',
                      imageHeight: 100,
                      imageWidth: 100,
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Advertisement slider or additional content
          Positioned(
            top: 250, // Adjust this to position slider below categories
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AdvertisementWidget(), // Widget for slider or advertisement
              ],
            ),
          ),
        ],
      ),
    );
  }// widget end
  // @override
  // Widget build (BuildContext context ){
  //   return
  //
  // }// widget end
  // Function to build individual menu items
  Widget _buildMenuItem(String title,
      {String? imagePath, double? imageWidth, double? imageHeight}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10), // Spacing around each item
      child: GestureDetector(
        onTap: () {
          print('$title clicked'); // Debugging for menu item taps
        },
        child: Column(
          mainAxisSize: MainAxisSize.min, // Items fit their content
          children: [
            if (imagePath != null) // Only show image if path is provided
              Image.asset(
                imagePath,
                width: imageWidth ?? 24, // Default image width if not specified
                height: imageHeight ?? 24, // Default image height
              ),
            const SizedBox(height: 5), // Space between image and text
            Text(
              title,
              style: const TextStyle(
                fontSize: 24, // Large text for clarity
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );

  }
}
