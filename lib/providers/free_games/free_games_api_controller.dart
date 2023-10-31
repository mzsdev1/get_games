import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_games/providers/free_games/freegames_api_filter.dart';
import 'package:get_games/models/free_games_model.dart';
import 'package:http/http.dart' as http;

final freeGamesProvider = FutureProvider<List<FreeGamesModel>>((ref) async {
  final selectedFilter = ref.watch(selectedFiltersProvider);
  final filtersString = selectedFilter.join('.');
  final selectedGameTypeString = ref.watch(selectedGameTypeProvider);

  final url = Uri.parse(
      "https://www.gamerpower.com/api/filter?platform=$filtersString&type=$selectedGameTypeString");

  try {
    final response = await http.get(url);
    print(url);

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      final List<FreeGamesModel> gamesList = jsonList
          .map((json) => FreeGamesModel.fromJson(json as Map<String, dynamic>))
          .toList();
      return gamesList;
    } else {
      throw Exception(
          "Error: Request failed with status ${response.statusCode}");
    }
  } catch (e) {
    throw Exception("Error: $e");
  }
});
