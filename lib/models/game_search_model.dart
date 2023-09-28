// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

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
    gameID = json['gameID'];
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
}

// class GameSearchModel {
//   String? gameID;
//   String? steamAppID;
//   String? cheapest;
//   String? cheapestDealID;
//   String? external;
//   String? internalName;
//   String? thumb;
//   GameSearchModel({
//     this.gameID,
//     this.steamAppID,
//     this.cheapest,
//     this.cheapestDealID,
//     this.external,
//     this.internalName,
//     this.thumb,
//   });

//   GameSearchModel copyWith({
//     String? gameID,
//     String? steamAppID,
//     String? cheapest,
//     String? cheapestDealID,
//     String? external,
//     String? internalName,
//     String? thumb,
//   }) {
//     return GameSearchModel(
//       gameID: gameID ?? this.gameID,
//       steamAppID: steamAppID ?? this.steamAppID,
//       cheapest: cheapest ?? this.cheapest,
//       cheapestDealID: cheapestDealID ?? this.cheapestDealID,
//       external: external ?? this.external,
//       internalName: internalName ?? this.internalName,
//       thumb: thumb ?? this.thumb,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'gameID': gameID,
//       'steamAppID': steamAppID,
//       'cheapest': cheapest,
//       'cheapestDealID': cheapestDealID,
//       'external': external,
//       'internalName': internalName,
//       'thumb': thumb,
//     };
//   }

//   factory GameSearchModel.fromMap(Map<String, dynamic> map) {
//     return GameSearchModel(
//       gameID: map['gameID'] != null ? map['gameID'] as String : null,
//       steamAppID:
//           map['steamAppID'] != null ? map['steamAppID'] as String : null,
//       cheapest: map['cheapest'] != null ? map['cheapest'] as String : null,
//       cheapestDealID: map['cheapestDealID'] != null
//           ? map['cheapestDealID'] as String
//           : null,
//       external: map['external'] != null ? map['external'] as String : null,
//       internalName:
//           map['internalName'] != null ? map['internalName'] as String : null,
//       thumb: map['thumb'] != null ? map['thumb'] as String : null,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory GameSearchModel.fromJson(String source) =>
//       GameSearchModel.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() {
//     return 'GameSearchModel(gameID: $gameID, steamAppID: $steamAppID, cheapest: $cheapest, cheapestDealID: $cheapestDealID, external: $external, internalName: $internalName, thumb: $thumb)';
//   }

//   @override
//   bool operator ==(covariant GameSearchModel other) {
//     if (identical(this, other)) return true;

//     return other.gameID == gameID &&
//         other.steamAppID == steamAppID &&
//         other.cheapest == cheapest &&
//         other.cheapestDealID == cheapestDealID &&
//         other.external == external &&
//         other.internalName == internalName &&
//         other.thumb == thumb;
//   }

//   @override
//   int get hashCode {
//     return gameID.hashCode ^
//         steamAppID.hashCode ^
//         cheapest.hashCode ^
//         cheapestDealID.hashCode ^
//         external.hashCode ^
//         internalName.hashCode ^
//         thumb.hashCode;
//   }
// }
