import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_games/utils/constants/string_constants.dart';
import 'package:http/http.dart' as http;
import 'package:get_games/data/models/game_search_model.dart';

final gameSearchApiProvider =
    FutureProvider<List<GameSearchModel>>((ref) async {
  final query = ref.watch(searchQueryProvider);

  final url = Uri.parse(
      "${StringConstants.gameDealsBaseUrl}games?title=$query&limit=30");

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);

      final List<GameSearchModel> gamesList = jsonList
          .map((json) => GameSearchModel.fromJson(json as Map<String, dynamic>))
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

final searchQueryProvider = StateProvider<String>((ref) => 'call of duty');
