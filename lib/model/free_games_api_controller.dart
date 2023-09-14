import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_games/model/free_games_model.dart';
import 'package:http/http.dart' as http;

final freeGamesProvider = FutureProvider<List<FreeGamesModel>>((ref) async {
  final url = Uri.parse(
      "https://www.gamerpower.com/api/giveaways?platform=pc&type=game");

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // Parse the JSON response into a list of FreeGamesModel
      final List<dynamic> jsonList = json.decode(response.body);
      final List<FreeGamesModel> gamesList = jsonList
          .map((json) => FreeGamesModel.fromJson(json as Map<String, dynamic>))
          .toList();
      return gamesList;
    } else {
      throw Exception("Error: ${response.statusCode}");
    }
  } catch (e) {
    throw Exception("Error: $e");
  }
});

// Assuming your FreeGamesModel.fromJson function is correctly implemented.

//Stream! 

// import 'dart:convert';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:get_games/model/free_games_model.dart';
// import 'package:http/http.dart' as http;

// final freeGamesProvider = StreamProvider<List<FreeGamesModel>>((ref) async* {
//   final url = Uri.parse(
//       "https://www.gamerpower.com/api/giveaways?platform=pc&type=game");

//   try {
//     final response = await http.get(url);

//     if (response.statusCode == 200) {
//       // Parse the JSON response into a list of FreeGamesModel
//       final List<dynamic> jsonList = json.decode(response.body);
//       final List<FreeGamesModel> gamesList = jsonList
//           .map((json) => FreeGamesModel.fromJson(json as Map<String, dynamic>))
//           .toList();
//       yield gamesList;
//     } else {
//       throw Exception("Error: ${response.statusCode}");
//     }
//   } catch (e) {
//     throw Exception("Error: $e");
//   }
// });

// // Assuming your FreeGamesModel.fromJson function is correctly implemented.

