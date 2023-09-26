// // ignore_for_file: unnecessary_this

// class FavoriteGameModel {
//   Info? info;
//   CheapestPriceEver? cheapestPriceEver;
//   List<Deals>? deals;

//   FavoriteGameModel({this.info, this.cheapestPriceEver, this.deals});

//   FavoriteGameModel.fromJson(Map<String, dynamic> json) {
//     info = json['info'] != null ? Info.fromJson(json['info']) : null;
//     cheapestPriceEver = json['cheapestPriceEver'] != null
//         ? CheapestPriceEver.fromJson(json['cheapestPriceEver'])
//         : null;
//     if (json['deals'] != null) {
//       deals = <Deals>[];
//       json['deals'].forEach((v) {
//         deals!.add(Deals.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (this.info != null) {
//       data['info'] = this.info!.toJson();
//     }
//     if (this.cheapestPriceEver != null) {
//       data['cheapestPriceEver'] = this.cheapestPriceEver!.toJson();
//     }
//     if (this.deals != null) {
//       data['deals'] = this.deals!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Info {
//   String? title;
//   String? steamAppID;
//   String? thumb;

//   Info({this.title, this.steamAppID, this.thumb});

//   Info.fromJson(Map<String, dynamic> json) {
//     title = json['title'];
//     steamAppID = json['steamAppID'];
//     thumb = json['thumb'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['title'] = this.title;
//     data['steamAppID'] = this.steamAppID;
//     data['thumb'] = this.thumb;
//     return data;
//   }
// }

// class CheapestPriceEver {
//   String? price;
//   int? date;

//   CheapestPriceEver({this.price, this.date});

//   CheapestPriceEver.fromJson(Map<String, dynamic> json) {
//     price = json['price'];
//     date = json['date'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['price'] = this.price;
//     data['date'] = this.date;
//     return data;
//   }
// }

// class Deals {
//   String? storeID;
//   String? dealID;
//   String? price;
//   String? retailPrice;
//   String? savings;

//   Deals(
//       {this.storeID, this.dealID, this.price, this.retailPrice, this.savings});

//   Deals.fromJson(Map<String, dynamic> json) {
//     storeID = json['storeID'];
//     dealID = json['dealID'];
//     price = json['price'];
//     retailPrice = json['retailPrice'];
//     savings = json['savings'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['storeID'] = this.storeID;
//     data['dealID'] = this.dealID;
//     data['price'] = this.price;
//     data['retailPrice'] = this.retailPrice;
//     data['savings'] = this.savings;
//     return data;
//   }
// }

//testtodo : todo:

// To parse this JSON data, do
//
//     final favoriteGameModel = favoriteGameModelFromJson(jsonString);

// FavoriteGameModel favoriteGameModelFromJson(String str) =>
//     FavoriteGameModel.fromJson(json.decode(str));

// String favoriteGameModelToJson(FavoriteGameModel data) =>
//     json.encode(data.toJson());

// class FavoriteGameModel {
//   Info info;
//   CheapestPriceEver cheapestPriceEver;
//   List<Deal> deals;

//   FavoriteGameModel({
//     required this.info,
//     required this.cheapestPriceEver,
//     required this.deals,
//   });

//   factory FavoriteGameModel.fromJson(Map<String, dynamic> json) =>
//       FavoriteGameModel(
//         info: Info.fromJson(json["info"]),
//         cheapestPriceEver:
//             CheapestPriceEver.fromJson(json["cheapestPriceEver"]),
//         deals: List<Deal>.from(json["deals"].map((x) => Deal.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "info": info.toJson(),
//         "cheapestPriceEver": cheapestPriceEver.toJson(),
//         "deals": List<dynamic>.from(deals.map((x) => x.toJson())),
//       };
// }

// class CheapestPriceEver {
//   String price;
//   int date;

//   CheapestPriceEver({
//     required this.price,
//     required this.date,
//   });

//   factory CheapestPriceEver.fromJson(Map<String, dynamic> json) =>
//       CheapestPriceEver(
//         price: json["price"],
//         date: json["date"],
//       );

//   Map<String, dynamic> toJson() => {
//         "price": price,
//         "date": date,
//       };
// }

// class Deal {
//   String storeId;
//   String dealId;
//   String price;
//   String retailPrice;
//   String savings;

//   Deal({
//     required this.storeId,
//     required this.dealId,
//     required this.price,
//     required this.retailPrice,
//     required this.savings,
//   });

//   factory Deal.fromJson(Map<String, dynamic> json) => Deal(
//         storeId: json["storeID"],
//         dealId: json["dealID"],
//         price: json["price"],
//         retailPrice: json["retailPrice"],
//         savings: json["savings"],
//       );

//   Map<String, dynamic> toJson() => {
//         "storeID": storeId,
//         "dealID": dealId,
//         "price": price,
//         "retailPrice": retailPrice,
//         "savings": savings,
//       };
// }

// class Info {
//   String title;
//   String steamAppId;
//   String thumb;

//   Info({
//     required this.title,
//     required this.steamAppId,
//     required this.thumb,
//   });

//   factory Info.fromJson(Map<String, dynamic> json) => Info(
//         title: json["title"],
//         steamAppId: json["steamAppID"],
//         thumb: json["thumb"],
//       );

//   Map<String, dynamic> toJson() => {
//         "title": title,
//         "steamAppID": steamAppId,
//         "thumb": thumb,
//       };
// }

//todo:

// class _Info {
//   final String title;
//   final String? steamAppID;
//   final String thumb;

//   _Info({required this.title, required this.steamAppID, required this.thumb});

//   factory _Info.fromJson(Map<String, dynamic> json) => _Info(
//         title: json['title'] as String,
//         steamAppID: json['steamAppID'] as String?,
//         thumb: json['thumb'] as String,
//       );
// }

// class _CheapestPriceEver {
//   final double price;
//   final DateTime date;

//   _CheapestPriceEver({required this.price, required this.date});

//   factory _CheapestPriceEver.fromJson(Map<String, dynamic> json) =>
//       _CheapestPriceEver(
//         price: double.parse(json['price'] as String),
//         date: DateTime.fromMillisecondsSinceEpoch((json['date'] as int) * 1000),
//       );
// }

// class AvailableDeal {
//   final String storeID;
//   final String dealID;
//   final double price;
//   final double retailPrice;
//   final double savings;

//   String get percentageOff => '-${savings.round()}%';

//   AvailableDeal({
//     required this.storeID,
//     required this.dealID,
//     required this.price,
//     required this.retailPrice,
//     required this.savings,
//   });

//   factory AvailableDeal.fromJson(Map<String, dynamic> json) => AvailableDeal(
//         storeID: json['storeID'] as String,
//         dealID: json['dealID'] as String,
//         price: double.parse(json['price'] as String),
//         retailPrice: double.parse(json['retailPrice'] as String),
//         savings: double.parse(json['savings'] as String),
//       );
// }

// class FavoriteGameModel {
//   // ignore: library_private_types_in_public_api
//   final _Info info;
//   // ignore: library_private_types_in_public_api
//   final _CheapestPriceEver cheapestPriceEver;
//   final List<AvailableDeal> deals;

//   FavoriteGameModel({
//     // ignore: library_private_types_in_public_api
//     required this.info,
//     // ignore: library_private_types_in_public_api
//     required this.cheapestPriceEver,
//     required this.deals,
//   });

//   factory FavoriteGameModel.fromJson(Map<String, dynamic> json) =>
//       FavoriteGameModel(
//         info: _Info.fromJson(json['info'] as Map<String, dynamic>),
//         cheapestPriceEver: _CheapestPriceEver.fromJson(
//             json['cheapestPriceEver'] as Map<String, dynamic>),
//         deals: (json['deals'] as Iterable)
//             .map<AvailableDeal>(
//                 (e) => AvailableDeal.fromJson(e as Map<String, dynamic>))
//             .toList(),
//       );
// }

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
}
