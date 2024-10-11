// lib/data file/storeview/detailscreen.dart

import 'package:flutter/material.dart';
import 'package:fruits_app/data%20file/storeview/cart.dart'; // Import the Cart

class FruitDetailScreen extends StatefulWidget {
  final String imagePath;
  final String name;
  final int price;
  final String description; // Description field

  const FruitDetailScreen({
    required this.imagePath,
    required this.name,
    required this.price,
    required this.description,
    super.key,
  });

  @override
  _FruitDetailScreenState createState() => _FruitDetailScreenState();
}

class _FruitDetailScreenState extends State<FruitDetailScreen> {
  int _quantity = 1;

  void _increaseQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decreaseQuantity() {
    setState(() {
      if (_quantity > 1) {
        _quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView( // To handle overflow on smaller screens
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                widget.imagePath,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            // Product Name
            Text(
              widget.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            // Product Price
            Text(
              "RS: ${widget.price}",
              style: const TextStyle(
                fontSize: 18,
                color: Colors.orange,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            // Product Description
            Text(
              widget.description,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 10),
            // Quantity Selector
            const Text(
              "Quantity:",
              style: TextStyle(fontSize: 18),
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: _decreaseQuantity,
                ),
                Text(
                  _quantity.toString(),
                  style: const TextStyle(fontSize: 18),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _increaseQuantity,
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Add to Cart Button
            ElevatedButton(
              onPressed: () {
                // Add product with description and imagePath to the cart
                cart.addItem(
                  widget.name,
                  widget.price,
                  _quantity,
                  widget.description,
                  widget.imagePath,
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Added $_quantity ${widget.name} to cart!')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Add to Cart',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
