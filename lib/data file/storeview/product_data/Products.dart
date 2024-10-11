
import 'package:flutter/material.dart';
import 'package:fruits_app/data%20file/storeview/cardwidget.dart';
import 'package:fruits_app/data%20file/storeview/cartscreen.dart';

import 'Popular food photo/popular_screen.dart';
import 'hottest food photo/hottest_screen.dart';
import 'new combo food photo/new_combo_screen.dart';
import 'recomendedfood/recommended code.dart';
import 'top food photo/top_screen.dart';

class MyProducts extends StatefulWidget {
  final String name;
  const MyProducts({super.key, required this.name});

  @override
  State<MyProducts> createState() => _MyProductsState();
}

class _MyProductsState extends State<MyProducts> with TickerProviderStateMixin {
  late TabController _tabController;  // TabController to control tab changes

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);  // Initialize the TabController
  }

  @override
  void dispose() {
    _tabController.dispose();  // Dispose of the TabController when the widget is destroyed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Categories'),
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // Navigate to CartScreen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
              child: Text(
                'Welcome ${widget.name}',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                // Handle Home tap
                Navigator.pop(context);
                // Optionally, navigate to Home if you have a separate Home screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.category),
              title: const Text('Categories'),
              onTap: () {
                // Handle Categories tap
                Navigator.pop(context);
                // Optionally, navigate to Categories if you have a separate Categories screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text('Your Cart'),
              onTap: () {
                // Navigate to CartScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CartScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                // Handle Logout tap
                Navigator.pop(context);
                // Implement actual logout functionality here
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Greeting and Search Section
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Greeting Text
                    Text(
                      'Hello ${widget.name}, What fruit salad combo do you want today?',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Search Bar
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: 'Search for fruit salad combos',
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Recommended Combo Title
                    Text(
                      'Recommended Combo',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    // Recommended Combos
                    Recommended()
                  ],
                ),
                const SizedBox(height: 10), // Add spacing before TabBar

                // TabBar to switch between different product categories
                TabBar(
                  padding: EdgeInsets.zero,
                  tabAlignment: TabAlignment.start,
                  controller: _tabController,
                  indicatorColor: Colors.orange,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  isScrollable: true,
                  tabs: const [
                    Tab(child: Text("Hottest")),
                    Tab(child: Text("Popular")),
                    Tab(child: Text("New Combo")),
                    Tab(child: Text("Top")),
                  ],
                ),

                // TabBarView to show the corresponding content for each tab
                SizedBox(
                  height: 350,  // Adjust height as needed
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      // 1st Tab content (Hottest)
                      HottestScreen(),

                      // 2nd Tab content (Popular)
                       PopularScreen(),

                      // 3rd Tab content (New Combo)
                       NewComboScreen(),

                      // 4th Tab content (Top)
                       TopScreen(),
                    ],
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
