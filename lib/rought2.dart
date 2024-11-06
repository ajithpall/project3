/*import 'package:flutter/material.dart';

class FrontPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade100,
        elevation: 0,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/logo.png', // Replace with your logo
                height: 20,
              ),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.login, color: Colors.black),
              onPressed: () {},
            ),
            DropdownButton<String>(
              value: 'India',
              items: <String>['India', 'USA', 'UK'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {},
            ),
            IconButton(
              icon: Icon(Icons.menu, color: Colors.black),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Top menu section
          Container(
            color: Colors.green.shade100,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('About'),
                Text('Become a seller'),
                Text('Gift card'),
                Text('List her easily accessing settings'),
                Text('Cart'),
              ],
            ),
          ),
          // Categories Row
          Container(
            color: Colors.green.shade100,
            height: 80,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildCategoryItem('Fashion', Icons.checkroom),
                _buildCategoryItem('Electronics', Icons.devices_other),
                _buildCategoryItem('Mobile', Icons.phone_android),
                _buildCategoryItem('Appliances', Icons.kitchen),
                _buildCategoryItem('Toys', Icons.toys),
                _buildCategoryItem('Grocery', Icons.local_grocery_store),
              ],
            ),
          ),
          // Main Carousel Section
          Expanded(
            child: Container(
              color: Colors.green.shade100,
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {},
                  ),
                  Expanded(
                    child: Image.asset(
                      'assets/toys_banner.png', // Replace with your banner image
                      fit: BoxFit.cover,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper function to build category items
  Widget _buildCategoryItem(String title, IconData icon) {
    return Column(
      children: [
        Icon(icon, size: 40),
        Text(title),
      ],
    );
  }
}
*/
