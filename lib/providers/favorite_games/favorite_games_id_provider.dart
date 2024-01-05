import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_games/utils/constants/string_constants.dart';
import 'package:get_games/localizations/locale_keys.g.dart';
import 'package:get_games/providers/storage/shared_pref_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteGamesIdNotifier extends StateNotifier<List<String>> {
  FavoriteGamesIdNotifier(this.pref)
      : super(pref?.getStringList(StringConstants.favoriteSharedPrefId) ?? []);

  final SharedPreferences? pref;

  void toggle(String favoriteId, BuildContext context) {
    if (state.contains(favoriteId)) {
      pref!.remove(favoriteId);
      state = state.where((id) => id != favoriteId).toList();

      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 3),
          content: Text(LocaleKeys.snackbarTexts_deletedText.tr()),
        ),
      );
    } else {
      state = [...state, favoriteId];

      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 3),
          content: Text(LocaleKeys.snackbarTexts_addedText.tr()),
        ),
      );
    }

    pref!.setStringList(StringConstants.favoriteSharedPrefId, state);
  }

  void deleteAllFavorites(BuildContext context) {
    pref!.remove(StringConstants.favoriteSharedPrefId);
    state = [];

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: Text(LocaleKeys.snackbarTexts_allGamesRemovedText.tr()),
      ),
    );
  }
}

final favoriteGamesIdProvider =
    StateNotifierProvider<FavoriteGamesIdNotifier, List<String>>((ref) {
  final pref = ref.watch(sharedPrefs).maybeWhen(
        data: (value) => value,
        orElse: () => null,
      );
  return FavoriteGamesIdNotifier(pref);
});
