import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_games/providers/shared_pref_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeIntNotifier extends StateNotifier<bool> {
  ThemeIntNotifier(this.pref) : super(pref?.getBool("themeMode") ?? false);

//test
  final SharedPreferences? pref;

  void toggleTheme() {
    if (state == false) {
      pref?.setBool("themeMode", true);
      state = true;
    } else {
      pref?.setBool("themeMode", false);
      state = false;
    }
  }
}

final themeIndexProvider = StateNotifierProvider<ThemeIntNotifier, bool>((ref) {
  final pref = ref.watch(sharedPrefs).maybeWhen(
        data: (value) => value,
        orElse: () => null,
      );
  return ThemeIntNotifier(pref);
});
