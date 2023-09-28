import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_games/providers/shared_pref_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteGameIds extends StateNotifier<List<String>> {
  FavoriteGameIds(this.pref) : super(pref?.getStringList("test1") ?? []);

  final SharedPreferences? pref;

  void toggle(String favoriteId) {
    if (state.contains(favoriteId)) {
      pref!.remove(favoriteId);
      state = state.where((id) => id != favoriteId).toList();
    } else {
      state = [...state, favoriteId];
    }

    pref!.setStringList("test1", state);
  }

  void deleteAllFavorites() {
    pref!.remove("test1");
    state = [];
  }
}

final favoriteGameIdsProvider =
    StateNotifierProvider<FavoriteGameIds, List<String>>((ref) {
  final pref = ref.watch(sharedPrefs).maybeWhen(
        data: (value) => value,
        orElse: () => null,
      );
  return FavoriteGameIds(pref);
});
