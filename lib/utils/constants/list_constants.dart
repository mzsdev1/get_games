import 'package:flutter/material.dart';

import '../../ui/views/favorite_games/game_favorite_view.dart';
import '../../ui/views/free_games/free_games_list_view.dart';
import '../../ui/views/game_deals/game_deals_list_view.dart';
import '../../ui/views/search_game/game_search_view.dart';
import '../../ui/views/settings/settings_view.dart';

class ListConstants {
  const ListConstants._();

  static const activeStoresList = ["epic-games-store", "steam", "gog"];

  static const allStoresList = [
    'epic-games-store',
    'steam',
    'gog',
    "itchio",
    "ubisoft",
    "origin",
    'battlenet',
    "drm-free",
  ];

  static const storeLabels = ["Steam", "Epic"];

  static const List<Widget> viewList = [
    FreeGamesListView(),
    GameDealsListView(),
    SearchGameView(),
    FavoriteGamesView(),
    SettingsView(),
  ];
}
