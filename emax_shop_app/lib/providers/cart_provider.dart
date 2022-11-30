import 'package:flutter/widgets.dart';

class CartItem {
  final String id;
  final String productName;
  final int quantity;
  final double price;

  CartItem(
      {required this.id,
      required this.productName,
      required this.quantity,
      required this.price});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};
  Map<String, CartItem> get items {
    return {..._items};
  }

  void addItem(String productId, double price, String productName) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existingCartItem) => CartItem(
                id: existingCartItem.id,
                productName: existingCartItem.productName,
                price: existingCartItem.price,
                quantity: existingCartItem.quantity + 1,
              ));
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
              id: DateTime.now().toString(),
              productName: productName,
              quantity: 1,
              price: price));
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (!_items.containsKey(productId)) {
      return;
    }
    if (_items[productId]!.quantity > 1) {
      _items.update(
          productId,
          (existingCartItem) => CartItem(
                id: existingCartItem.id,
                price: existingCartItem.price,
                productName: existingCartItem.productName,
                quantity: existingCartItem.quantity - 1,
              ));
    } else {
      _items.remove(productId);
    }
     notifyListeners();
  }
}
