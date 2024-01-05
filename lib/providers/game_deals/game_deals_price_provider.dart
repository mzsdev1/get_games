import 'package:flutter_riverpod/flutter_riverpod.dart';

final gameDealsMinPriceProvider = StateProvider<double>((ref) {
  return 0.10;
});

final gameDealsMaxPriceProvider = StateProvider<double>((ref) {
  return 80.0;
});
