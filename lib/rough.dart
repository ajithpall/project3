/*@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('welcome to Our Shop'),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.account_circle),
          onPressed: () {},
        ),
      ],
    ),

    // body
    body: Container(
      // color decoration
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.green  , Colors.white ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      //scroll view
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for products...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
            // Promotional Banner
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://via.placeholder.com/400x150.png?text=Big+Sale+Banner',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // Categories Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Categories',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
            //icons
            SizedBox(
              height: 100,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      child:
                      categoryTile(context, 'Electronics', Icons.devices),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      child:
                      categoryTile(context, 'Fashion', Icons.checkroom),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      child: categoryTile(context, 'Home', Icons.home),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      child: categoryTile(context, 'Beauty', Icons.brush),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      child: categoryTile(context, 'Sports', Icons.sports),
                    ),
                  ],
                ),
              ),
            ),


            // Featured Products Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Featured Products',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
            //gridview.builder
            GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 0.75,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return productTile(
                  context,
                  'Product $index',
                  'https://via.placeholder.com/150',
                  '\$${(20 + index * 5).toStringAsFixed(2)}',
                );
              },
            ),
          ],
        ),
      ),
    ),
  );
}

// Category Tile
Widget categoryTile(BuildContext context, String title, IconData icon) {
  return Container(
    width: 60,
    margin: const EdgeInsets.only(right: 8),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.green),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(color: Colors.green, fontSize: 14),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}

// Product Tile
Widget productTile(
    BuildContext context, String title, String imageUrl, String price) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
          child: Image.network(
            imageUrl,
            height: 30,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            price,
            style: const TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Spacer(),


        // add to cart button
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {},
            child: const Text('Add tp Cart'),
          ),
        ),
      ],
    ),
  );
}
}
*/
