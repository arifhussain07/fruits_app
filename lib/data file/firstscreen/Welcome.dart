import 'package:flutter/material.dart';

import '../secondscreen/yourname.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 400,
            width: 400,
            color: Colors.orange,
            child: Image.asset(
              'lib/data file/firstscreen/image/mainphoto1.png',
              // fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Column(
              // Changed to Column to stack multiple text widgets
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Get The Freshest Fruit Salad Combo',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 10), // Adding space between the texts
                Text(
                  'We deliver the best and freshest fruit salad in town. Order for a combo today!!!',
                  style: TextStyle(fontSize: 16), // Styling for the second text
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => YourName(),
                ),
              ); // Close the push method call
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15), // Increases button size
              minimumSize: Size(150, 50), // Sets minimum width and height
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Make the button rectangular with no rounded corners
              ),
            ),
            child: Text(
              'Let’s Continue',
              style: TextStyle(fontSize: 18, color: Colors.white), // Optional: Increase text size
            ),
          )
        ],
      ),
    );
  }
}
