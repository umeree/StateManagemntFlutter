import "package:flutter/material.dart";

class FavoriteItemProvider with ChangeNotifier {
  List<int> _favoriteItems = [];
  List<int> get favoriteItems => _favoriteItems;

  void addItem(int value) {
    _favoriteItems.add(value);
    notifyListeners();
  }

  void removeItem(int value) {
    _favoriteItems.remove(value);
    notifyListeners();
  }
}
