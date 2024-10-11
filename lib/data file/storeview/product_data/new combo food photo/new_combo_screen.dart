// lib/data file/storeview/new_combo_screen.dart

import 'package:flutter/material.dart';
import 'package:fruits_app/data%20file/storeview/cardwidget.dart';

class NewComboScreen extends StatelessWidget {
  const NewComboScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: const [
          ProductCard(
            name: 'Mix Fruits Combo 1',
            price: 150,
            imagePath: 'lib/data file/storeview/product_data/new combo food photo/mix friuts combo 1.png',
            description: 'A delightful mix of seasonal fruits with honey drizzle.',
          ),
          ProductCard(
            name: 'Mix Fruits Combo 2',
            price: 105,
            imagePath: 'lib/data file/storeview/product_data/new combo food photo/mix friuts combo 2.png',
            description: 'A refreshing combination of exotic fruits and berries.',
          ),
          // Add more ProductCards as needed
        ],
      ),
    );
  }
}
