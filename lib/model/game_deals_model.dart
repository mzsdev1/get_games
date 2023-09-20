// class GameDealsModel {
//   final String internalName;
//   String? title;
//   final String metacriticLink;
//   final String dealId;
//   final String storeId;
//   final String gameId;
//   final String salePrice;
//   final String normalPrice;
//   final String isOnSale;
//   final String savings;
//   final String metacriticScore;
//   final String steamRatingText;
//   final String steamRatingPercent;
//   final String steamRatingCount;
//   final String steamAppId;
//   final int releaseDate;
//   final int lastChange;
//   final String dealRating;
//   final String thumb;

//   GameDealsModel(
//       {required this.internalName,
//       required this.title,
//       required this.metacriticLink,
//       required this.dealId,
//       required this.storeId,
//       required this.gameId,
//       required this.salePrice,
//       required this.normalPrice,
//       required this.isOnSale,
//       required this.savings,
//       required this.metacriticScore,
//       required this.steamRatingText,
//       required this.steamRatingPercent,
//       required this.steamRatingCount,
//       required this.steamAppId,
//       required this.releaseDate,
//       required this.lastChange,
//       required this.dealRating,
//       required this.thumb});

//   factory GameDealsModel.fromJson(Map<String, dynamic> json) => GameDealsModel(
//         internalName: json['internalName'],
//         title: json['title'] ?? "Unknown", //ToDO:
//         metacriticLink: json['metacriticLink'],
//         dealId: json['dealID'],
//         storeId: json['storeID'],
//         gameId: json['gameID'],
//         salePrice: json['salePrice'],
//         normalPrice: json['normalPrice'],
//         isOnSale: json['isOnSale'],
//         savings: json['savings'],
//         metacriticScore: json['metacriticScore'],
//         steamRatingText: json['steamRatingText'],
//         steamRatingPercent: json['steamRatingPercent'],
//         steamRatingCount: json['steamRatingCount'],
//         steamAppId: json['steamAppID'],
//         releaseDate: json['releaseDate'],
//         lastChange: json['lastChange'],
//         dealRating: json['dealRating'],
//         thumb: json['thumb'],
//       );
// }

//TODO:
class GameDealsModel {
  String? title;
  String? dealID;
  String? salePrice;
  String? normalPrice;
  String? savings;
  String? metacriticScore;
  String? steamRatingText;
  String? steamRatingPercent;
  String? steamRatingCount;
  int? releaseDate;
  int? lastChange;
  String? dealRating;
  String? thumb;

  GameDealsModel(
      {this.title,
      this.dealID,
      this.salePrice,
      this.normalPrice,
      this.savings,
      this.metacriticScore,
      this.steamRatingText,
      this.steamRatingPercent,
      this.steamRatingCount,
      this.releaseDate,
      this.lastChange,
      this.dealRating,
      this.thumb});

  GameDealsModel.fromJson(Map<String, dynamic> json) {
    title = json['title'] ?? "N/A";
    dealID = json['dealID'];
    salePrice = json['salePrice'] ?? "0";
    normalPrice = json['normalPrice'] ?? "0";
    savings = json['savings'] ?? "0";
    metacriticScore = json['metacriticScore'] ?? "0";
    steamRatingText = json['steamRatingText'] ?? "N/A";
    steamRatingPercent = json['steamRatingPercent'] ?? "0";
    steamRatingCount = json['steamRatingCount'] ?? "0";
    releaseDate = json['releaseDate'];
    lastChange = json['lastChange'];
    dealRating = json['dealRating'] ?? "0";
    thumb = json['thumb'];
  }
}
