import 'package:flutter/material.dart';
import 'Products.dart';

class ConfirmationScreen extends StatelessWidget {
  final String userName; // To pass userName to MyProducts

  ConfirmationScreen({required this.userName}); // Constructor to pass userName

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Top: Checkmark in a circle
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green[100],
                  ),
                  child: Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 100,
                  ),
                ),
                SizedBox(height: 30), // Space between icon and text

                // Middle: Congratulation Texts
                Text(
                  'Congratulations!!!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 10), // Space between main text and description

                Text(
                  'Your order has been taken and is being attended to',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: 40), // Space between text and buttons

                // Bottom: Buttons
                ElevatedButton(
                  onPressed: () {
                    // Add your action for tracking order
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange, // Background color of button
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Rounded corners
                    ),
                  ),
                  child: Text(
                    'Track order',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 15), // Space between the two buttons

                OutlinedButton(
                  onPressed: () {
                    // Navigate to the main shopping page (MyProducts) on button click
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyProducts(name: userName), // Replace with MyProducts screen
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    side: BorderSide(color: Colors.orange), // Border color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Rounded corners
                    ),
                  ),
                  child: Text(
                    'Continue shopping',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.orange,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}