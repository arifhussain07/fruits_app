// lib/data file/storeview/my_products.dart
import 'package:flutter/material.dart';
 // Import CartScreen
import 'package:fruits_app/data%20file/storeview/cardwidget.dart';
import 'package:fruits_app/data%20file/storeview/cartscreen.dart';



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
        title: Text('Product Categories'),
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Navigate to CartScreen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
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
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                // Handle Home tap
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyProducts(name: '',),));
              },
            ),
            ListTile(
              leading: Icon(Icons.category),
              title: Text('Categories'),
              onTap: () {
                // Handle Categories tap
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('Your Cart'),
              onTap: () {
                // Navigate to CartScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                // Handle Logout tap
                Navigator.pop(context);
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
                // Search and Recommended Combo Section
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Search Bar
                    Text( 'Hello ${widget.name}, What fruit salad combo do you want today?',style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),),
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
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
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ProductCard(
                            name: 'Fajita Pizza',
                            price: 1500,
                            imagePath: 'lib/data file/storeview/foodphoto/recomendedfood/homepizza.png',
                            description: 'A delicious pizza topped with fajita chicken, cheese, and bell peppers.',
                          ),
                          ProductCard(
                            name: 'Fajita Pizza',
                            price: 99,
                            imagePath: 'assets/images/product1.jpg',
                            description: 'A delicious pizza topped with fajita chicken, cheese, and bell peppers.',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10), // Add spacing before TabBar

                // TabBar to switch between different product categories
                TabBar(

                  controller: _tabController,
                  indicatorColor: Colors.orange,
                  labelColor: Colors.black,

                  padding: EdgeInsets.zero,
                  tabAlignment: TabAlignment.start,

                  automaticIndicatorColorAdjustment: true,
                  isScrollable: true,
                  tabs: const [
                    Tab(child: Text("Hottest")),
                    Tab(child: Text("Popular")),
                    Tab(child: Text("New combo")),
                    Tab(child: Text("Top")),
                  ],
                ),

                // TabBarView to show the corresponding content for each tab
                SizedBox(
                  height: 300,  // Set an appropriate height for the TabBarView
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      // 1st Tab content (Hottest)
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ProductCard(
                              name: 'Hottest Fajita Pizza',
                              price: 1500,
                              imagePath: 'assets/images/product1.jpg',
                              description: 'The hottest Fajita Pizza with extra toppings.',
                            ),
                            ProductCard(
                              name: 'Hottest Burger',
                              price: 120,
                              imagePath: 'assets/images/product2.jpg',
                              description: 'A juicy burger with all the fixings.',
                            ),
                          ],
                        ),
                      ),

                      // 2nd Tab content (Popular)
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ProductCard(
                              name: 'Popular Pizza',
                              price: 130,
                              imagePath: 'assets/images/product3.jpg',
                              description: 'A popular choice for pizza lovers.',
                            ),
                            ProductCard(
                              name: 'Popular Salad',
                              price: 85,
                              imagePath: 'assets/images/product4.jpg',
                              description: 'A fresh and tasty salad.',
                            ),
                          ],
                        ),
                      ),

                      // 3rd Tab content (New Combo)
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ProductCard(
                              name: 'New Combo Pizza',
                              price: 150,
                              imagePath: 'assets/images/product5.jpg',
                              description: 'A new combo of pizza with sides.',
                            ),
                            ProductCard(
                              name: 'New Combo Wrap',
                              price: 105,
                              imagePath: 'assets/images/product6.jpg',
                              description: 'A tasty wrap with new ingredients.',
                            ),
                          ],
                        ),
                      ),

                      // 4th Tab content (Top)
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ProductCard(
                              name: 'Top Pizza',
                              price: 160,
                              imagePath: 'assets/images/product7.jpg',
                              description: 'Top-rated pizza with premium toppings.',
                            ),
                            ProductCard(
                              name: 'Top Sandwich',
                              price: 95,
                              imagePath: 'assets/images/product8.jpg',
                              description: 'A top-notch sandwich with fresh ingredients.',
                            ),
                          ],
                        ),
                      ),
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
