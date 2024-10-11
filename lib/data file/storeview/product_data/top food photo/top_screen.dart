// lib/data file/storeview/top_screen.dart

import 'package:flutter/material.dart';
import 'package:fruits_app/data%20file/storeview/cardwidget.dart';

class TopScreen extends StatelessWidget {
  const TopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: const [
          ProductCard(
            name: 'Banana Bliss',
            price: 160,
            imagePath: 'lib/data file/storeview/product_data/top food photo/banana.png',
            description: 'Creamy banana slices with a sprinkle of chia seeds.',
          ),
          ProductCard(
            name: 'Pomegranate Punch',
            price: 95,
            imagePath: 'lib/data file/storeview/product_data/top food photo/pomegranate.png',
            description: 'Juicy pomegranate seeds mixed with citrus flavors.',
          ),
          // Add more ProductCards as needed
        ],
      ),
    );
  }
}
