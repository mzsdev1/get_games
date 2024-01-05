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
    savings = (double.tryParse(json['savings'])?.toStringAsFixed(0) ?? "0");
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
