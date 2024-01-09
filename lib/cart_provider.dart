import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<Map<String, dynamic>> cart = [];
  void addItemToCart(Map<String, dynamic> product) {
    cart.add(product);
    notifyListeners();
  }

  void removeItemFromCart(Map<String, dynamic> product) {
    cart.remove(product);
    notifyListeners();
  }
}
