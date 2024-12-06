import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class AdvertisementWidget extends StatelessWidget {
  AdvertisementWidget({super.key});
  final List<String> imgList = [
    'images/toys.jpeg',
    'images/grocery.png',
    'images/mobile.png',
  ];

  final CarouselSliderController _carouselController = CarouselSliderController(); // CarouselController instance
  @override
  Widget build(BuildContext context) {
    double screen_width =MediaQuery.of(context).size.width;
    double screen_height =MediaQuery.of(context).size.height;
    return Stack(
      children: [
        CarouselSlider.builder(
          carouselController: _carouselController, // Attach the controller
          itemCount: imgList.length,
          itemBuilder: (context, index, realIndex) {
            return Container(
              width: screen_width,
              height:screen_height/2,
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  // Using local assets with Image.asset
                  imgList[index],
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
          options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            enlargeCenterPage: true,
            aspectRatio: 20 / 9,
            viewportFraction: 0.8,
          ),
        ),
        Positioned(
          left: 0,
          top: 0,
          bottom: 0,
          child: IconButton(
            icon: const Icon(Icons.arrow_left, color: Colors.white),
            onPressed: () {
              _carouselController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          bottom: 0,
          child: IconButton(
            icon: const Icon(Icons.arrow_right, color: Colors.white),
            onPressed: () {
              _carouselController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }, // on pressed event
          ),
        ),
      ],
    );
  }
}