import 'package:flutter/material.dart';
import 'slider.dart';
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
            height: MediaQuery.of(context).size.height*2, // height of the page
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
            ),
          ),
          // slider
          const Positioned(
            top: 250, // Adjust this to position the slider vertically in the middle
            left: 0,
            right: 0,
            child: Center(
              child: ProductSlider(
                productImages: [
                  'https://example.com/image1.jpg',
                  'https://example.com/image2.jpg',
                  'https://example.com/image3.jpg',
                ],
              ),
            ),
          ),
        ], // children
      ),
    );
  }
}
