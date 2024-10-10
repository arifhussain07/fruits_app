import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fruits_app/data%20file/storeview/Products.dart';

class YourName extends StatefulWidget {
  const YourName({super.key});

  @override
  _YourNameState createState() => _YourNameState();
}

class _YourNameState extends State<YourName> {
  final TextEditingController _nameController = TextEditingController();
  String _validationMessage = '';
  String? _savedName;

  @override
  void initState() {
    super.initState();
    _loadSavedName();
  }

  // Load saved name from SharedPreferences
  Future<void> _loadSavedName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedName = prefs.getString('userName');
    });

    // If a name is already saved, go to the next screen automatically
    if (_savedName != null) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(

          builder: (context) => MyProducts(name: _savedName!),
        ),
            (route) => false, // This will remove all previous routes
      );
    }
  }

  // Save the name to SharedPreferences
  Future<void> _saveName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 400,
              width: 400,
              color: Colors.orange,
              child: Image.asset(
                'lib/data file/secondscreen/image/secondphoto.png',
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'What is your firstname?',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: 'Enter your name',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    _validationMessage,
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (_nameController.text.isEmpty) {
                  setState(() {
                    _validationMessage = 'Please enter your name';
                  });
                } else {
                  setState(() {
                    _validationMessage = '';
                  });
                  // Save the name and navigate to the next screen, removing all previous routes
                  await _saveName(_nameController.text);
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => MyProducts(name: _nameController.text),
                    ),
                        (route) => false, // This will remove all previous routes
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                minimumSize: Size(150, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Start Ordering',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
