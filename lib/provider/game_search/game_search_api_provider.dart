import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:get_games/model/game_search_model.dart';

final gameSearchProvider = FutureProvider<List<GameSearchModel>>((ref) async {
  final query = ref.watch(searchQueryProvider);

  final url =
      Uri.parse("https://www.cheapshark.com/api/1.0/games?title=$query");

  try {
    final response = await http.get(url);
    print(url);

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

final searchQueryProvider = StateProvider<String>((ref) => '');
