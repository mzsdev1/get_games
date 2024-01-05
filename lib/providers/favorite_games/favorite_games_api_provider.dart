import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_games/utils/constants/string_constants.dart';
import 'package:get_games/data/models/favorite_games_model.dart';
import 'package:get_games/providers/favorite_games/favorite_games_id_provider.dart';
import 'package:http/http.dart' as http;

final favoriteGamesApiProvider = FutureProvider<List<FavoriteGamesModel>>(
  (ref) async {
    final gameIds = ref.watch(favoriteGamesIdProvider);
    final idsString = gameIds.join(',');

    var ukk =
        "${StringConstants.gameDealsBaseUrl}games?ids=$idsString&format=array";

    final url = Uri.parse(ukk);

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);

        final List<FavoriteGamesModel> gamesList = jsonList
            .map(
              (json) => FavoriteGamesModel.fromJson(
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
