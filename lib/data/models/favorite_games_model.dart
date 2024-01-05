import 'package:flutter/foundation.dart';

class FavoriteGamesModel {
  Info? info;
  CheapestPriceEver? cheapestPriceEver;
  List<Deals>? deals;

  FavoriteGamesModel({this.info, this.cheapestPriceEver, this.deals});

  FavoriteGamesModel.fromJson(Map<String, dynamic> json) {
    info = json['info'] != null ? Info.fromJson(json['info']) : null;
    cheapestPriceEver = json['cheapestPriceEver'] != null
        ? CheapestPriceEver.fromJson(json['cheapestPriceEver'])
        : null;
    if (json['deals'] != null) {
      deals = <Deals>[];
      json['deals'].forEach((v) {
        deals!.add(Deals.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (info != null) {
      data['info'] = info!.toJson();
    }
    if (cheapestPriceEver != null) {
      data['cheapestPriceEver'] = cheapestPriceEver!.toJson();
    }
    if (deals != null) {
      data['deals'] = deals!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  bool operator ==(covariant FavoriteGamesModel other) {
    if (identical(this, other)) return true;

    return other.info == info &&
        other.cheapestPriceEver == cheapestPriceEver &&
        listEquals(other.deals, deals);
  }

  @override
  int get hashCode =>
      info.hashCode ^ cheapestPriceEver.hashCode ^ deals.hashCode;

  @override
  String toString() =>
      'FavoriteGameModel(info: $info, cheapestPriceEver: $cheapestPriceEver, deals: $deals)';
}

class Info {
  String? gameID;
  String? title;
  String? steamAppID;
  String? thumb;

  Info({this.gameID, this.title, this.steamAppID, this.thumb});

  Info.fromJson(Map<String, dynamic> json) {
    gameID = json['gameID'];
    title = json['title'];
    steamAppID = json['steamAppID'];
    thumb = json['thumb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['gameID'] = gameID;
    data['title'] = title;
    data['steamAppID'] = steamAppID;
    data['thumb'] = thumb;
    return data;
  }

  @override
  bool operator ==(covariant Info other) {
    if (identical(this, other)) return true;

    return other.gameID == gameID &&
        other.title == title &&
        other.steamAppID == steamAppID &&
        other.thumb == thumb;
  }

  @override
  int get hashCode {
    return gameID.hashCode ^
        title.hashCode ^
        steamAppID.hashCode ^
        thumb.hashCode;
  }

  @override
  String toString() {
    return 'Info(gameID: $gameID, title: $title, steamAppID: $steamAppID, thumb: $thumb)';
  }
}

class CheapestPriceEver {
  String? price;
  int? date;

  CheapestPriceEver({this.price, this.date});

  CheapestPriceEver.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['price'] = price;
    data['date'] = date;
    return data;
  }
}

class Deals {
  String? storeID;
  String? dealID;
  String? price;
  String? retailPrice;
  String? savings;

  Deals(
      {this.storeID, this.dealID, this.price, this.retailPrice, this.savings});

  Deals.fromJson(Map<String, dynamic> json) {
    storeID = json['storeID'];
    dealID = json['dealID'];
    price = json['price'];
    retailPrice = json['retailPrice'];
    savings = json['savings'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['storeID'] = storeID;
    data['dealID'] = dealID;
    data['price'] = price;
    data['retailPrice'] = retailPrice;
    data['savings'] = savings;
    return data;
  }

  @override
  String toString() {
    return 'Deals(storeID: $storeID, dealID: $dealID, price: $price, retailPrice: $retailPrice, savings: $savings)';
  }
}
