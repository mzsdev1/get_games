import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_games/providers/shared_pref_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteGameIds extends StateNotifier<List<String>> {
  FavoriteGameIds(this.pref)
      : super(pref?.getStringList("favorite_game_ids") ?? []);

  final SharedPreferences? pref;

  void toggle(String favoriteId, BuildContext context) {
    if (state.contains(favoriteId)) {
      pref!.remove(favoriteId);
      state = state.where((id) => id != favoriteId).toList();

//todo
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 3),
          content: Text('Game removed from favorites list.'),
        ),
      );

      //todo.
    } else {
      state = [...state, favoriteId];

      //todo
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 3),
          content: Text('Game added to favorites list.'),
        ),
      );

      //todo.
    }

    pref!.setStringList("favorite_game_ids", state);
  }

  void deleteAllFavorites(BuildContext context) {
    pref!.remove("favorite_game_ids");
    state = [];

    //todo
    //ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        duration: Duration(seconds: 3),
        content: Text('All games removed.'),
      ),
    );
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
