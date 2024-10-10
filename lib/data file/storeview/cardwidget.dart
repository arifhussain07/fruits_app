// lib/data file/storeview/cardwidget.dart
import 'package:flutter/material.dart';
import 'package:fruits_app/data%20file/storeview/detailscreen.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final int price;
  final String imagePath;
  final String description; // Add description field

  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.imagePath,
    required this.description, // Include description in constructor
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigate to FruitDetailScreen when tapped
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FruitDetailScreen(
              imagePath: imagePath,
              name: name,
              price: price,
              description: description,
            ),
          ),
        );
      },
      child: Container(
        height: 220,
        width: 170,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 7,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image.asset(
                imagePath,
                height: 130,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            // Product Name
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Product Price
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                '\RS: $price',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
// lib/data file/storeview/cart.dart
class Cart {
  List<Map<String, dynamic>> _items = [];

  void addItem(String name, int price, int quantity, String description) {
    _items.add({
      'name': name,
      'price': price,
      'quantity': quantity,
      'description': description,
    });
  }

  List<Map<String, dynamic>> getItems() {
    return _items;
  }

  int getItemCount() {
    return _items.length;
  }

  void clearCart() {
    _items.clear();
  }
}

// Create a global Cart instance
final Cart cart = Cart();
