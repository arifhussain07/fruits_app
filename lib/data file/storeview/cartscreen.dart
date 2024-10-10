// lib/data file/storeview/cart_screen.dart
import 'package:flutter/material.dart';
import 'package:fruits_app/data%20file/storeview/cardwidget.dart';


class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        backgroundColor: Colors.orange,
      ),
      body: cart.getItemCount() == 0
          ? const Center(
        child: Text('Your cart is empty.'),
      )
          : ListView.builder(
        itemCount: cart.getItemCount(),
        itemBuilder: (context, index) {
          final item = cart.getItems()[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.orange,
              child: Text(
                item['quantity'].toString(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            title: Text(item['name']),
            subtitle: Text('Description: ${item['description']}'),
            trailing: Text('RS: ${item['price']}'),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Implement checkout functionality here
            // For demonstration, we'll clear the cart and show a confirmation
            if (cart.getItemCount() > 0) {
              cart.clearCart();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Checkout successful!')),
              );
              Navigator.pop(context);
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: const Text(
            'Checkout',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
