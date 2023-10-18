// import 'dart:convert';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:get_games/models/favorite_game_model.dart';
// import 'package:get_games/providers/game_favorite/favorites_provider.dart';
// import 'package:http/http.dart' as http;

// final gameFavoriteApiProvider = FutureProvider<List<FavoriteGameModel>>(
//   (ref) async {
//     final gameIds = ref.watch(favoriteGameIdsProvider);
//     final idsString = gameIds.join(',');
//     var ukk =
//         "https://www.cheapshark.com/api/1.0/games?ids=$idsString&format=array";
//     final url = Uri.parse(ukk);
// //https://www.cheapshark.com/api/1.0/games?ids=$idsString
//     try {
//       final response = await http.get(url);
//       print("favoriteGameApi: $url");
//       print("ids: $gameIds");
//       print("istek yollandı");

//       if (response.statusCode == 200) {
//         final List<dynamic> jsonList = json.decode(response.body);

//         final List<FavoriteGameModel> gamesList = jsonList
//             .map(
//               (json) => FavoriteGameModel.fromJson(
//                 json as Map<String, dynamic>,
//               ),
//             )
//             .toList();

//         return gamesList;
//       } else {
//         throw Exception(
//             "Error: Request failed with status ${response.statusCode}");
//       }
//     } catch (e) {
//       throw Exception("Error: $e");
//     }
//   },
// );

//TODO

import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_games/models/favorite_game_model.dart';
import 'package:get_games/providers/game_favorite/favorites_provider.dart';
import 'package:http/http.dart' as http;

final gameFavoriteApiProvider = FutureProvider<List<FavoriteGameModel>>(
  (ref) async {
    final gameIds = ref.watch(favoriteGameIdsProvider);
    final idsString = gameIds.join(',');
    var ukk =
        "https://www.cheapshark.com/api/1.0/games?ids=$idsString&format=array";
    final url = Uri.parse(ukk);

    try {
      final response = await http.get(url);
      print("favoriteGameApi: $url");
      print("ids: $gameIds");
      print("istek yollandı");

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);

        final List<FavoriteGameModel> gamesList = jsonList
            .map(
              (json) => FavoriteGameModel.fromJson(
                json as Map<String, dynamic>,
              ),
            )
            .toList();

        return gamesList;
      } else {
        throw Exception(
            "Error: Request failed with status ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  },
);
