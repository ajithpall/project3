import 'package:flutter/material.dart';
import 'slider.dart';
import 'demoslider.dart';

class bodyone extends StatefulWidget {
  const bodyone({super.key});

  @override
  State<bodyone> createState() => bodyoneState();
}

class bodyoneState extends State<bodyone> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            height:
                MediaQuery.of(context).size.height * 2, // height of the page
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.green.shade100,
                  Colors.green.shade50,
                  Colors.green.shade100
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [
                  0.2,
                  0.5,
                  0.8,
                ], // 20% green100, 50% green50 , 80 % green100
              ),
            ),
          ),
          // second appbar for fast getting a settings
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(
                        0, 3), // this determine the x and y axis of shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildMenuItem('About'),
                  _buildMenuItem('Cart'),
                  _buildMenuItem('Gift Card'),
                  _buildMenuItem('Become a Seller'),
                  /*Padding ( padding: EdgeInsets.fromLTRB(10, 0, 10, 0),// padding adjustment here
                     child: GestureDetector (
                      onTap : () {print ( ' ');},
                     child:  const Text ('About',
                     style: TextStyle(
                       fontSize: 20,
                       fontWeight: FontWeight.bold,
                       fontStyle: FontStyle.italic ,
                       color: Colors.black ,
                       // decoration : TextDecoration.underline,
                       //letterSpacing : 2.0 ,
                     ),
                     ),

                     ),
                  ),*/
                  /* Padding ( padding: EdgeInsets.fromLTRB(10, 0, 10, 0),// padding adjustment here
                    child: GestureDetector (
                      onTap : () {print ( ' ');},
                      child:  const Text ('cart',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic ,
                          color: Colors.black ,
                          // decoration : TextDecoration.underline,
                          //letterSpacing : 2.0 ,
                        ),
                      ),

                    ),
                  ),*/
                ],
              ),
            ),
          ),

          Positioned(
            top: 51,
            left: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(
                        0, 3), // this determine the x and y axis of shadow
                  ),
                ],
              ),
              child: Row(
                // text row
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _buildMenuItem('Home Appliances',
                      imagePath: 'images/appliances.png',
                      imageHeight: 100,
                      imageWidth: 100),
                  _buildMenuItem('Electronics',
                      imagePath: 'images/appliances.png',
                      imageHeight: 100,
                      imageWidth: 100),
                  _buildMenuItem('Toys',
                      imagePath: 'images/toys.jpeg',
                      imageHeight: 100,
                      imageWidth: 100),
                  _buildMenuItem('Mobiles',
                      imagePath: 'images/mobile.png',
                      imageHeight: 100,
                      imageWidth: 100),
                  _buildMenuItem('Fashion',
                      imagePath: 'images/fashion.png',
                      imageHeight: 100,
                      imageWidth: 100),
                  _buildMenuItem('Grocery',
                      imagePath: 'images/grocery.png',
                      imageHeight: 100,
                      imageWidth: 100),
                ],
              ),
            ),
          ),
          // slider
          Positioned(
            top: 250,
            // Adjust this to position the slider vertically in the middle
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AdvertisementWidget(),
                /*ProductSlider(
                productImages: [
                  'images/logo.jpeg',
                  'images/logo.jpeg',
                  'images/logo.jpeg',
                ],
              ),*/
              ],
            ),
          ),
        ], // children
      ),
    );
  }
}

Widget _buildMenuItem(String title,
    {String? imagePath, double? imageWidth, double? imageHeight}) {
  // text and image for second appbar
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: GestureDetector(
      onTap: () {
        print('$title clicked');
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (imagePath != null) // Show image only if imagePath is provided
            Image.asset(
              imagePath,
              width: imageWidth ?? 24, // Default width if not provided
              height: imageHeight ?? 24, // Default height if not provided
            ),
          const SizedBox(height: 5), // Space between icon and text
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    ),
  );
}
