class GameSearchModel {
  String? gameID;
  String? steamAppID;
  String? cheapest;
  String? cheapestDealID;
  String? external;
  String? internalName;
  String? thumb;

  GameSearchModel(
      {this.gameID,
      this.steamAppID,
      this.cheapest,
      this.cheapestDealID,
      this.external,
      this.internalName,
      this.thumb});

  GameSearchModel.fromJson(Map<String, dynamic> json) {
    gameID = json['gameID'] ?? "0";
    steamAppID = json['steamAppID'];
    cheapest = json['cheapest'];
    cheapestDealID = json['cheapestDealID'];
    external = json['external'];
    internalName = json['internalName'];
    thumb = json['thumb'];
  }

  @override
  bool operator ==(covariant GameSearchModel other) {
    if (identical(this, other)) return true;

    return other.gameID == gameID &&
        other.steamAppID == steamAppID &&
        other.cheapest == cheapest &&
        other.cheapestDealID == cheapestDealID &&
        other.external == external &&
        other.internalName == internalName &&
        other.thumb == thumb;
  }

  @override
  int get hashCode {
    return gameID.hashCode ^
        steamAppID.hashCode ^
        cheapest.hashCode ^
        cheapestDealID.hashCode ^
        external.hashCode ^
        internalName.hashCode ^
        thumb.hashCode;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'gameID': gameID,
      'steamAppID': steamAppID,
      'cheapest': cheapest,
      'cheapestDealID': cheapestDealID,
      'external': external,
      'internalName': internalName,
      'thumb': thumb,
    };
  }

  @override
  String toString() {
    return 'GameSearchModel(gameID: $gameID, steamAppID: $steamAppID, cheapest: $cheapest, cheapestDealID: $cheapestDealID, external: $external, internalName: $internalName, thumb: $thumb)';
  }
}
