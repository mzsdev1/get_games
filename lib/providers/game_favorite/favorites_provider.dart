import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_games/providers/shared_pref_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteGameIds extends StateNotifier<List<String>> {
  FavoriteGameIds(this.pref) : super(pref?.getStringList("test1") ?? []);

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
          content: Text('Game removed from favorite list.'),
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
          content: Text('Game added favorite list.'),
        ),
      );

      //todo.
    }

    pref!.setStringList("test1", state);
  }

  void deleteAllFavorites(BuildContext context) {
    pref!.remove("test1");
    state = [];

    //todo
    //ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        duration: Duration(seconds: 3),
        content: Text('All games removed.'),
      ),
    );

    //todo.
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



// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:get_games/providers/shared_pref_provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class FavoriteGameIds extends StateNotifier<List<String>> {
//   FavoriteGameIds(this.pref) : super(pref?.getStringList("test1") ?? []);

//   final SharedPreferences? pref;

//   void toggle(String favoriteId) {
//     if (state.contains(favoriteId)) {
//       pref!.remove(favoriteId);
//       state = state.where((id) => id != favoriteId).toList();
//     } else {
//       state = [...state, favoriteId];
//     }

//     pref!.setStringList("test1", state);
//   }

//   void deleteAllFavorites() {
//     pref!.remove("test1");
//     state = [];
//   }
// }

// final favoriteGameIdsProvider =
//     StateNotifierProvider<FavoriteGameIds, List<String>>((ref) {
//   final pref = ref.watch(sharedPrefs).maybeWhen(
//         data: (value) => value,
//         orElse: () => null,
//       );
//   return FavoriteGameIds(pref);
// });
