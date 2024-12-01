import 'package:flutter/material.dart';
import 'cart.dart';

class ProductDetailPage extends StatefulWidget {
  final String image;
  final String name;
  final String price;
  final String description;

  ProductDetailPage({
    Key? key,
    required this.image,
    required this.name,
    required this.price,
    required this.description,
  }) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final List<Map<String, String>> comments = [
    {'name': 'Eric Hoffman', 'comment': 'Good value for money. Highly recommend!'},
    {'name': 'Alice Johnson', 'comment': 'Product as described. Excellent quality!'},
  ];

  final List<Map<String, dynamic>> cartItems = []; // Cart items list

  void addToCart() {
    setState(() {
      cartItems.add({
        'image': widget.image,
        'name': widget.name,
        'price': widget.price,
        'quantity': 1,
      });
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${widget.name} added to cart!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void goToCart() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CartPage(cartItems: cartItems), // CartPage integration
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: goToCart,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              Center(
                child: Image.asset(
                  widget.image,
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),

              // Product Name
              Text(
                widget.name,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),

              // Price Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.price,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: addToCart, // Add item to cart
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Add to Cart',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Package Size Section
              const Text(
                "Package Size",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Row(
                children: const [
                  _PackageSizeButton(text: "Rs.106\n500 pellets"),
                  SizedBox(width: 8),
                  _PackageSizeButton(text: "Rs.166\n1000 pellets"),
                  SizedBox(width: 8),
                  _PackageSizeButton(text: "Rs.252\n3000 pellets"),
                ],
              ),
              const SizedBox(height: 16),

              // Product Details Section
              const Text(
                "Product Details",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                widget.description,
                style: const TextStyle(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(height: 16),

              // Expiry Date
              const Text(
                "Expiry Date: 25/12/2023",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),

              // Ratings and Reviews
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 20),
                  const Icon(Icons.star, color: Colors.amber, size: 20),
                  const Icon(Icons.star, color: Colors.amber, size: 20),
                  const Icon(Icons.star, color: Colors.amber, size: 20),
                  const Icon(Icons.star_border, color: Colors.amber, size: 20),
                  const SizedBox(width: 8),
                  const Text(
                    "4.4 (923 Ratings)",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Customer Comments
              const Text(
                "Customer Comments",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ...comments.map((comment) => ListTile(
                    title: Text(
                      comment['name']!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(comment['comment']!),
                  )),
              const SizedBox(height: 24),

              // Go to Cart Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: goToCart, // Navigate to cart
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    "Go to Cart",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PackageSizeButton extends StatelessWidget {
  final String text;

  const _PackageSizeButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 14),
      ),
    );
  }
}


