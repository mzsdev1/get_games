import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StoreApiNameNotifier extends ChangeNotifier {
  String selectedStoreLabel = "Steam"; // Initial store name
  int selectedApiNumber = 1; // Initial API number

  void changeStore(String newStoreLabel) {
    if (newStoreLabel != selectedStoreLabel) {
      selectedStoreLabel = newStoreLabel;
      selectedApiNumber = (newStoreLabel == "Steam") ? 1 : 25;
      notifyListeners(); // Notify listeners about the change
    }
  }
}

final storeNameProvider = ChangeNotifierProvider<StoreApiNameNotifier>((ref) {
  return StoreApiNameNotifier();
});
