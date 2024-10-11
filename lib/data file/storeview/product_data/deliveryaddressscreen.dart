import 'package:flutter/material.dart';
import 'package:fruits_app/data%20file/storeview/product_data/cardpaymentscreen.dart';
import 'informationscreen.dart';

class DeliveryAddressScreen extends StatelessWidget {
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  DeliveryAddressScreen({super.key});

  // Function to check if address and phone fields are empty
  bool _isInputValid(BuildContext context) {
    if (addressController.text.isEmpty || phoneController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your delivery address and phone number.')),
      );
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delivery Information'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Delivery address',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: addressController,
              decoration: InputDecoration(
                hintText: 'Enter your delivery address',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Number we can call',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: 'Enter your phone number',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Check if address and phone number are not empty before proceeding
                    if (_isInputValid(context)) {
                      // Navigate to confirmation screen or any other action
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ConfirmationScreen(userName: '',)),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Order placed with Pay on Delivery')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Pay on delivery', style: TextStyle(color: Colors.black)),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Check if address and phone number are not empty before proceeding
                    if (_isInputValid(context)) {
                      // Navigate to the Card Payment Screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CardPaymentScreen()),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Pay with card', style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
