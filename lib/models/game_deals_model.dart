// ignore_for_file: public_member_api_docs, sort_constructors_first
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
// class GameDealsModel {
//   String? title;
//   String? dealID;
//   String? gameId;
//   String? salePrice;
//   String? normalPrice;
//   String? savings;
//   String? metacriticScore;
//   String? steamRatingText;
//   String? steamRatingPercent;
//   String? steamRatingCount;
//   DateTime? releaseDate;
//   DateTime? lastChange;
//   String? dealRating;
//   String? thumb;

//   GameDealsModel(
//       {this.title,
//       this.dealID,
//       this.salePrice,
//       this.normalPrice,
//       this.savings,
//       this.metacriticScore,
//       this.steamRatingText,
//       this.steamRatingPercent,
//       this.steamRatingCount,
//       this.releaseDate,
//       this.lastChange,
//       this.dealRating,
//       this.thumb});

//   GameDealsModel.fromJson(Map<String, dynamic> json) {
//     title = json['title'] ?? "N/A";
//     dealID = json['dealID'];
//     gameId = json['gameID'];
//     salePrice = json['salePrice'] ?? "0";
//     normalPrice = json['normalPrice'] ?? "0";
//     savings = (double.tryParse(json['savings'])?.toStringAsFixed(0) ??
//         "0"); //json['savings'] ?? "0";
//     metacriticScore = json['metacriticScore'] ?? "0";
//     steamRatingText = json['steamRatingText'] ?? "N/A";
//     steamRatingPercent = json['steamRatingPercent'] ?? "0";
//     steamRatingCount = json['steamRatingCount'] ?? "0";
//     releaseDate = json['releaseDate'] != null
//         ? DateTime.fromMillisecondsSinceEpoch(
//             (json['releaseDate'] as int) * 1000)
//         : DateTime.now();
//     lastChange = json['lastChange'] != null
//         ? DateTime.fromMillisecondsSinceEpoch(
//             (json['lastChange'] as int) * 1000)
//         : DateTime.now();
//     dealRating = json['dealRating'] ?? "0";
//     thumb = json['thumb'];
//   }
// }

//equatable

class GameDealsModel {
  String? title;
  String? dealID;
  String? gameId;
  String? salePrice;
  String? normalPrice;
  String? savings;
  String? metacriticScore;
  String? steamRatingText;
  String? steamRatingPercent;
  String? steamRatingCount;
  DateTime? releaseDate;
  DateTime? lastChange;
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
    gameId = json['gameID'];
    salePrice = json['salePrice'] ?? "0";
    normalPrice = json['normalPrice'] ?? "0";
    savings = (double.tryParse(json['savings'])?.toStringAsFixed(0) ??
        "0"); //json['savings'] ?? "0";
    metacriticScore = json['metacriticScore'] ?? "0";
    steamRatingText = json['steamRatingText'] ?? "N/A";
    steamRatingPercent = json['steamRatingPercent'] ?? "0";
    steamRatingCount = json['steamRatingCount'] ?? "0";
    releaseDate = json['releaseDate'] != null
        ? DateTime.fromMillisecondsSinceEpoch(
            (json['releaseDate'] as int) * 1000)
        : DateTime.now();
    lastChange = json['lastChange'] != null
        ? DateTime.fromMillisecondsSinceEpoch(
            (json['lastChange'] as int) * 1000)
        : DateTime.now();
    dealRating = json['dealRating'] ?? "0";
    thumb = json['thumb'];
  }

  @override
  bool operator ==(covariant GameDealsModel other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.dealID == dealID &&
        other.gameId == gameId &&
        other.salePrice == salePrice &&
        other.normalPrice == normalPrice &&
        other.savings == savings &&
        other.metacriticScore == metacriticScore &&
        other.steamRatingText == steamRatingText &&
        other.steamRatingPercent == steamRatingPercent &&
        other.steamRatingCount == steamRatingCount &&
        other.releaseDate == releaseDate &&
        other.lastChange == lastChange &&
        other.dealRating == dealRating &&
        other.thumb == thumb;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        dealID.hashCode ^
        gameId.hashCode ^
        salePrice.hashCode ^
        normalPrice.hashCode ^
        savings.hashCode ^
        metacriticScore.hashCode ^
        steamRatingText.hashCode ^
        steamRatingPercent.hashCode ^
        steamRatingCount.hashCode ^
        releaseDate.hashCode ^
        lastChange.hashCode ^
        dealRating.hashCode ^
        thumb.hashCode;
  }

  @override
  String toString() {
    return 'GameDealsModel(title: $title, dealID: $dealID, gameId: $gameId, salePrice: $salePrice, normalPrice: $normalPrice, savings: $savings, metacriticScore: $metacriticScore, steamRatingText: $steamRatingText, steamRatingPercent: $steamRatingPercent, steamRatingCount: $steamRatingCount, releaseDate: $releaseDate, lastChange: $lastChange, dealRating: $dealRating, thumb: $thumb)';
  }
}
