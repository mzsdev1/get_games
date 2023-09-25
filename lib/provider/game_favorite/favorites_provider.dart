import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPrefs = FutureProvider<SharedPreferences>(
    (_) async => await SharedPreferences.getInstance());

class FavoriteGameIds extends StateNotifier<List<String>> {
  FavoriteGameIds(this.pref) : super(pref?.getStringList("test1") ?? []);

  final SharedPreferences? pref;

  void toggle(String favoriteId) {
    if (state.contains(favoriteId)) {
      pref!.remove(favoriteId);
      state = state.where((id) => id != favoriteId).toList();
    } else {
      //pref!.setStringList("id", state);
      state = [...state, favoriteId];
    }
    // Throw here since for some reason SharedPreferences could not be retrieved
    pref!.setStringList("test1", state);
  }

  //todo.
  void deleteAllFavorites() {
    pref!.remove("test1");
    state = [];
  }
//todo.
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
// import 'package:shared_preferences/shared_preferences.dart';

// final sharedPrefs = FutureProvider<SharedPreferences>(
//     (_) async => await SharedPreferences.getInstance());

// class FavoriteGameIds extends StateNotifier<List<String>> {
//   FavoriteGameIds(this.pref) : super(pref?.getStringList("test1") ?? []);

//   final SharedPreferences? pref;

//   void toggle(String favoriteId) {
//     final isNeedRefresh = ref.watch(isNeedRefreshProvider);
//     if (state.contains(favoriteId)) {
//       if (isNeedRefresh == true) {
//         pref!.remove(favoriteId);
//       }

//       state = state.where((id) => id != favoriteId).toList();
//     } else {
//       //pref!.setStringList("id", state);
//       state = [...state, favoriteId];
//     }
//     // Throw here since for some reason SharedPreferences could not be retrieved
//     if (isNeedRefresh == true) {
//       pref!.setStringList("test1", state);
//     }
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

// final isNeedRefreshProvider = StateProvider<bool>((ref) {
//   return false;
// });
