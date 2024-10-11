// lib/data file/storeview/popular_screen.dart

import 'package:flutter/material.dart';
import 'package:fruits_app/data%20file/storeview/cardwidget.dart';

class PopularScreen extends StatelessWidget {
  const PopularScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: const [
          ProductCard(
            name: 'Kiwi Delight',
            price: 130,
            imagePath: 'lib/data file/storeview/product_data/Popular food photo/kivi.png',
            description: 'Sweet and tangy kiwi slices combined with creamy yogurt.',
          ),
          ProductCard(
            name: 'Apple Crunch',
            price: 85,
            imagePath: 'lib/data file/storeview/product_data/Popular food photo/apple.png',
            description: 'Fresh apple chunks with a crunchy granola topping.',
          ),
          // Add more ProductCards as needed
        ],
      ),
    );
  }
}
