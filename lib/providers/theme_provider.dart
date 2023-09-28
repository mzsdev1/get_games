import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_games/providers/shared_pref_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeIntNotifier extends StateNotifier<int> {
  ThemeIntNotifier(this.pref) : super(pref?.getInt("themeMode") ?? 0);

  final SharedPreferences? pref;

  void toggleTheme() {
    if (state == 0) {
      pref?.setInt("themeMode", 1);
      state = 1;
    } else {
      pref?.setInt("themeMode", 0);
      state = 0;
    }
  }
}

final themeIndexProvider = StateNotifierProvider<ThemeIntNotifier, int>((ref) {
  final pref = ref.watch(sharedPrefs).maybeWhen(
        data: (value) => value,
        orElse: () => null,
      );
  return ThemeIntNotifier(pref);
});
