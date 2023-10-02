import 'package:flutter_riverpod/flutter_riverpod.dart';

// final gameDealsPriceProvider = StateProvider<double>((ref) {
//   return 0.1;
// });

final gameDealsMinPriceProvider = StateProvider<double>((ref) {
  return 0.50;
});

final gameDealsMaxPriceProvider = StateProvider<double>((ref) {
  return 80;
});
