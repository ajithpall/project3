/*SingleChildScrollView(
scrollDirection: Axis.horizontal,  // Make it horizontal
child: ListView.builder(
scrollDirection: Axis.horizontal,  // Horizontal scroll
itemCount: 10,  // Number of items
itemBuilder: (context, index) {
return _buildSliderItem('Item ${index + 1}');
},
),
);

Widget _buildSliderItem(String title) {
return Padding(
padding: const EdgeInsets.all(8.0),
child: Container(
width: 150,
height: 150,
color: Colors.blueAccent,
alignment: Alignment.center,
child: Text(
title,
style: const TextStyle(
color: Colors.white,
fontSize: 16,
fontWeight: FontWeight.bold,
),
),
),
);
}
*/