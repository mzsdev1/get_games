import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_games/model/favorite_game_model.dart';
import 'package:get_games/provider/game_favorite/favorites_provider.dart';
import 'package:http/http.dart' as http;

// final gameFavoriteApiProvider =
//     FutureProvider<List<FavoriteGameModel>>((ref) async {
//   final gameIds = ref.watch(favoriteGameIdsProvider);
//   final idsString = gameIds.join(',');

//   final url =
//       Uri.parse("https://www.cheapshark.com/api/1.0/games?ids=$idsString");

//   try {
//     final response = await http.get(url);
//     print("favoriteGameApi: $url");
//     print("ids: $gameIds");
//     print("istek yollandı");

//     if (response.statusCode == 200) {
//       final Map<String, dynamic> jsonList = json.decode(response.body);

//       final List<FavoriteGameModel> gamesList = jsonList.values
//           .map((json) =>
//               FavoriteGameModel.fromJson(json as Map<String, dynamic>))
//           .toList();

//       return gamesList;
//     } else {
//       throw Exception(
//           "Error: Request failed with status ${response.statusCode}");
//     }
//   } catch (e) {
//     throw Exception("Error: $e");
//   }
// });

final gameFavoriteApiProvider = FutureProvider<List<FavoriteGameModel>>(
  (ref) async {
    final gameIds = ref.watch(favoriteGameIdsProvider);
    final idsString = gameIds.join(',');
    var ukk =
        "https://www.cheapshark.com/api/1.0/games?ids=$idsString&format=array";
    final url = Uri.parse(ukk);
//https://www.cheapshark.com/api/1.0/games?ids=$idsString
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
//TODO
// final gameFavoriteApiProvider =
//     FutureProvider<List<FavoriteGameModel>>((ref) async {
//   final gameIds = ref.watch(favoriteGameIdsProvider);
//   final idsString = gameIds.join(',');
//   final isNeedRefresh = ref.watch(isNeedRefreshProvider);
//   final isFirstRequest = ref.watch(isFirstRequestProvider);

//   final url =
//       Uri.parse("https://www.cheapshark.com/api/1.0/games?ids=$idsString");

//   if (isFirstRequest || isNeedRefresh) {
//     try {
//       final response = await http.get(url);
//       print("favoriteGameApi: $url");
//       print("ids: $gameIds");
//       print("istek yollandı");

//       if (response.statusCode == 200) {
//         ref.read(isFirstRequestProvider.notifier).state =
//             false; // İlk isteği tamamladık

//         final Map<String, dynamic> jsonList = json.decode(response.body);

//         final List<FavoriteGameModel> gamesList = jsonList.values
//             .map((json) =>
//                 FavoriteGameModel.fromJson(json as Map<String, dynamic>))
//             .toList();

//         return gamesList;
//       } else {
//         throw Exception(
//             "Error: Request failed with status ${response.statusCode}");
//       }
//     } catch (e) {
//       throw Exception("Error: $e");
//     }
//   }
//   // API isteği yapılmasına gerek yoksa boş bir liste döndürün
//   return Future.value([]);
// });

// final isNeedRefreshProvider = StateProvider<bool>((ref) => false);
// final isFirstRequestProvider = StateProvider<bool>((ref) => true);
 








//todo
// final gameFavoriteApiProvider =
//     FutureProvider.autoDispose<List<FavoriteGameModel>>((ref) async {
//   final gameIds = ref.watch(favoriteGameIdsProvider);
//   final idsString = gameIds.join(',');
//   final bool isNeedRefresh = ref.watch(isNeedRefreshProvider);

//   if (!isNeedRefresh) {
//     // isNeedRefresh false ise, mevcut verileri kullanabilirsiniz.
//     return ref.read(lastDataResponseProvider); // Önceki verileri geri döndürün
//   }

//   final url =
//       Uri.parse("https://www.cheapshark.com/api/1.0/games?ids=$idsString");

//   try {
//     final response = await http.get(url);
//     print("favoriteGameApi: $url");

//     if (response.statusCode == 200) {
//       final Map<String, dynamic> jsonList = json.decode(response.body);

//       final List<FavoriteGameModel> gamesList = jsonList.values
//           .map((json) =>
//               FavoriteGameModel.fromJson(json as Map<String, dynamic>))
//           .toList();

//       // İstek başarıyla tamamlandığında isNeedRefresh'i false olarak ayarlayın
//       ref.read(isNeedRefreshProvider.notifier).state = false;

//       return gamesList;
//     } else {
//       throw Exception(
//           "Error: Request failed with status ${response.statusCode}");
//     }
//   } catch (e) {
//     throw Exception("Error: $e");
//   }
// });

// final isNeedRefreshProvider =
//     StateProvider<bool>((ref) => true); // Başlangıçta true olarak ayarlayın


//TODO

// final gameFavoriteApiProvider =
//     StreamProvider<List<FavoriteGameModel>>((ref) async* {
//   final gameIds = ref.watch(favoriteGameIdsProvider);
//   final idsString = gameIds.join(',');

//   final url =
//       Uri.parse("https://www.cheapshark.com/api/1.0/games?ids=$idsString");

//   try {
//     final response = await http.get(url);
//     print("favoriteGame: $url");
//     print("ids: $gameIds");

//     if (response.statusCode == 200) {
//       final Map<String, dynamic> jsonResponse = json.decode(response.body);

//       final List<FavoriteGameModel> gamesList = jsonResponse.values
//           .map((json) =>
//               FavoriteGameModel.fromJson(json as Map<String, dynamic>))
//           .toList();

//       yield gamesList; // Emit the list as a stream

//       // You can add some delay or polling logic here if needed
//       // await Future.delayed(Duration(seconds: 10)); // Example: Delay for 10 seconds

//       // You can continue to yield updated data here if needed
//     } else {
//       throw Exception(
//           "Error: Request failed with status ${response.statusCode}");
//     }
//   } catch (e) {
//     throw Exception("Error: $e");
//   }
// });
