import 'package:flutter/foundation.dart';

class CartModel extends ChangeNotifier {
  List<String> _items = [];
  List<String> get items => _items;

  void additems(String value) {
    _items.add(value);
    notifyListeners();
  }

  void removeItems(String value) {
    _items.remove(value);
    notifyListeners();
  }
}
