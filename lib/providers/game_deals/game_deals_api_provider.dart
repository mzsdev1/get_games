import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_games/utils/constants/string_constants.dart';
import 'package:get_games/data/models/game_deals_model.dart';
import 'package:get_games/providers/game_deals/game_deals_price_provider.dart';
import 'package:get_games/providers/game_deals/game_deals_store_provider.dart';
import 'package:http/http.dart' as http;

final gameDealsApiProvider = FutureProvider<List<GameDealsModel>>((ref) async {
  final minPriceProvider = ref.watch(gameDealsMinPriceProvider);
  final maxPriceProvider = ref.watch(gameDealsMaxPriceProvider);

  final storeProviderInt =
      ref.watch(gameDealsstoreNameProvider).selectedApiNumber;

  final url = Uri.parse(
      "${StringConstants.gameDealsBaseUrl}deals?storeID=${storeProviderInt.toString()}&lowerPrice=${minPriceProvider.toString()}&upperPrice=${maxPriceProvider.toString()}");

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);

      final List<GameDealsModel> gamesList = jsonList
          .map((json) => GameDealsModel.fromJson(json as Map<String, dynamic>))
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
