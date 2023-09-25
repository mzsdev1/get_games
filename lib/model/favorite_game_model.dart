// ignore_for_file: unnecessary_this

class FavoriteGameModel {
  Info? info;
  CheapestPriceEver? cheapestPriceEver;
  List<Deals>? deals;

  FavoriteGameModel({this.info, this.cheapestPriceEver, this.deals});

  FavoriteGameModel.fromJson(Map<String, dynamic> json) {
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
    if (this.info != null) {
      data['info'] = this.info!.toJson();
    }
    if (this.cheapestPriceEver != null) {
      data['cheapestPriceEver'] = this.cheapestPriceEver!.toJson();
    }
    if (this.deals != null) {
      data['deals'] = this.deals!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Info {
  String? title;
  String? steamAppID;
  String? thumb;

  Info({this.title, this.steamAppID, this.thumb});

  Info.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    steamAppID = json['steamAppID'];
    thumb = json['thumb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = this.title;
    data['steamAppID'] = this.steamAppID;
    data['thumb'] = this.thumb;
    return data;
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
    data['price'] = this.price;
    data['date'] = this.date;
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
    data['storeID'] = this.storeID;
    data['dealID'] = this.dealID;
    data['price'] = this.price;
    data['retailPrice'] = this.retailPrice;
    data['savings'] = this.savings;
    return data;
  }
}
