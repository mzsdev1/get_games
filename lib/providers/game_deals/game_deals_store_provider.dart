import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_games/utils/constants/string_constants.dart';

class StoreNameNotifier extends ChangeNotifier {
  String selectedStoreLabel = StringConstants.steam;
  int selectedApiNumber = 1;

  void changeStore(String newStoreLabel) {
    if (newStoreLabel != selectedStoreLabel) {
      selectedStoreLabel = newStoreLabel;
      selectedApiNumber = (newStoreLabel == StringConstants.steam) ? 1 : 25;
      notifyListeners();
    }
  }
}

final gameDealsstoreNameProvider =
    ChangeNotifierProvider<StoreNameNotifier>((ref) {
  return StoreNameNotifier();
});
