// lib/data file/storeview/cart.dart

class Cart {
  final List<Map<String, dynamic>> _items = [];

  void addItem(String name, int price, int quantity, String description, String imagePath) {
    _items.add({
      'name': name,
      'price': price,
      'quantity': quantity,
      'description': description,
      'imagePath': imagePath,
    });
  }

  List<Map<String, dynamic>> getItems() => _items;

  int getItemCount() => _items.length;

  void clearCart() => _items.clear();
}

// Create a global Cart instance
final Cart cart = Cart();
