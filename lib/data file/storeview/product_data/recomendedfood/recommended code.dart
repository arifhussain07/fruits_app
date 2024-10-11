import 'package:flutter/material.dart';

import '../../cardwidget.dart';

class Recommended extends StatelessWidget {
  const Recommended({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: const [
          ProductCard(
            name: 'Honey Lime Combo',
            price: 160,
            imagePath: 'lib/data file/storeview/product_data/recomendedfood/honey lime combo.png',
            description: 'A delicious mix of honey, lime, and fresh fruits.',
          ),
          ProductCard(
            name: 'Berry Mango Combo',
            price: 99,
            imagePath: 'lib/data file/storeview/product_data/recomendedfood/berry mango combo.png',
            description: 'Sweet berries blended with juicy mangoes.',
          ),
          // Add more ProductCards as needed
        ],
      ),
    );
  }
}
