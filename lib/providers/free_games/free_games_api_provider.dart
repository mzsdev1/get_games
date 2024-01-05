import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_games/utils/constants/string_constants.dart';
import 'package:get_games/providers/free_games/free_games_filter_provider.dart';
import 'package:get_games/data/models/free_games_model.dart';
import 'package:http/http.dart' as http;

final freeGamesApiProvider = FutureProvider<List<FreeGamesModel>>((ref) async {
  final selectedFilter = ref.watch(selectedFilterProvider);
  final filtersString = selectedFilter.join('.');
  final selectedGameTypeString = ref.watch(selectedTypeProvider);

  final url = Uri.parse(
      "${StringConstants.freeGamesBaseUrl}filter?platform=$filtersString&type=$selectedGameTypeString");

  try {
    final response = await http.get(url);

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
