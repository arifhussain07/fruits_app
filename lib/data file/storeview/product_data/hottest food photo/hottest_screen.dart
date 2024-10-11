// lib/data file/storeview/hottest_screen.dart

import 'package:flutter/material.dart';
import 'package:fruits_app/data%20file/storeview/cardwidget.dart';

class HottestScreen extends StatelessWidget {
  const HottestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: const [
          ProductCard(
            name: 'Cuiona Frits Salad',
            price: 150,
            imagePath: 'lib/data file/storeview/product_data/hottest food photo/cuiona frits salad.png',
            description: 'A refreshing salad with crispy cuiona frits, fresh vegetables, and a tangy dressing.',
          ),
          ProductCard(
            name: 'Tropical Fruit Salad',
            price: 120,
            imagePath: 'lib/data file/storeview/product_data/hottest food photo/tropical fruit salad.png',
            description: 'A vibrant mix of tropical fruits served fresh with a hint of mint.',
          ),
          // Add more ProductCards as needed
        ],
      ),
    );
  }
}
