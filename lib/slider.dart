import 'package:flutter/material.dart'; // importing a dart file


class ProductSlider extends StatefulWidget {
  final List<String> productImages; // List of image URLs
  const ProductSlider({
    super.key,
    required this.productImages,
  }); // initial starting the productImages required

  @override
  _ProductSliderState createState() => _ProductSliderState();
}

class _ProductSliderState extends State<ProductSlider> {
  int _currentIndex = 0;

  void _onPageChanged(int index) {
    // index change this triger this process
    setState(() {
      _currentIndex = index; //current page
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
    height: 400,
    child: Column(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,// maintain the aspect ration of image slider
            child: PageView.builder(// create a scrollable view of images
              itemCount: widget.productImages.length,// set the total number of pages to the number of images in product images
              onPageChanged: _onPageChanged,// whenever the page changes to update
              itemBuilder: (context, index) {
                return Image.asset(// creates each page ( images ) based on its index
                  widget.productImages[index],// loads the images form productimages and fills the available space without distorting
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
        ],
        /*  Row(
            mainAxisAlignment: MainAxisAlignment.center,// this make center the widget
            children: widget.productImages.map((image) {// create a thumbnail of image
              int index = widget.productImages.indexOf(image);
              return GestureDetector(// detects taps
                onTap: () {
                  _onPageChanged(index);// when the thumbnail is tapped this updates the main image slider to show the tapped image
                },
                child: Container(
                  width: 80,
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }).toList(),// converts the result of map into a list which is required for children in row */
          ),

      );
  }
}
