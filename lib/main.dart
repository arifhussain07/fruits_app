import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


import 'data file/firstscreen/Welcome.dart';
import 'data file/storeview/product_data/informationscreen.dart';
import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      debugShowCheckedModeBanner: false,
          // home: MyProducts(name: '',),
       // home: YourName(),
      // home: Welcome(),
      home: HomePage(),
      // home: MyProducts(name: '',),
      // home: ConfirmationScreen(userName: '',),

    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Display the image
            Image.asset('assets/images/fruitbox.png'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Welcome(),
                  ),
                ); // Close the push method call
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
              child: Text('Fruit Hub'),
            ),
          ],
        ),
      ),
    );
  }
}
