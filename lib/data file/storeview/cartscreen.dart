import 'package:flutter/material.dart';
import 'package:fruits_app/data%20file/storeview/cart.dart'; // Import the Cart
import 'product_data/deliveryaddressscreen.dart';  // Import the new screen

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

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
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              leading: Image.asset(
                item['imagePath'],
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(item['name']),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Description: ${item['description']}'),
                  Text('Quantity: ${item['quantity']}'),
                ],
              ),
              trailing: Text('RS: ${item['price']}'),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Check if the cart is empty
            if (cart.getItemCount() == 0) {
              // Show a message if the cart is empty
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Cart is Empty'),
                  content: const Text('You cannot proceed to checkout because your cart is empty.'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context); // Close the dialog
                      },
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            } else {
              // Navigate to the Delivery Address Screen if cart has items
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DeliveryAddressScreen()),
              );
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
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
