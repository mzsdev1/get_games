// import 'dart:convert';

// import 'package:get_games/model/game_search_model.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class FavoriteGamesSharedPreferences {
//   static const String FAVORITE_GAMES_KEY = 'favorite_games';

//   final SharedPreferences sharedPreferences;

//   FavoriteGamesSharedPreferences(this.sharedPreferences);

//   List<GameSearchModel> get favoriteGames {
//     final favoriteGamesJson = sharedPreferences.getString(FAVORITE_GAMES_KEY);
//     if (favoriteGamesJson == null) {
//       return [];
//     }

//     final favoriteGamesList = jsonDecode(favoriteGamesJson) as List<dynamic>;
//     return favoriteGamesList
//         .map((game) => GameSearchModel.fromJson(game))
//         .toList();
//   }

//   void setFavoriteGames(List<GameSearchModel> favoriteGames) {
//     final favoriteGamesJson = jsonEncode(favoriteGames);
//     sharedPreferences.setString(FAVORITE_GAMES_KEY, favoriteGamesJson);
//   }
// }
