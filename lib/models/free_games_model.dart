// class FreeGamesModel {
//   final int id;
//   final String title;
//   final String worth;
//   final String thumbnail;
//   final String image;
//   final String type;
//   final String description;
//   final String instructions;
//   final String openGiveawayUrl;
//   final String publishedDate;
//   final String platforms;
//   final String endDate;
//   final int users;
//   final String gamerpowerUrl;
//   final String openGiveaway;

//   const FreeGamesModel({
//     required this.id,
//     required this.title,
//     required this.worth,
//     required this.thumbnail,
//     required this.image,
//     required this.type,
//     required this.description,
//     required this.instructions,
//     required this.openGiveawayUrl,
//     required this.publishedDate,
//     required this.platforms,
//     required this.endDate,
//     required this.users,
//     required this.gamerpowerUrl,
//     required this.openGiveaway,
//   });

//   factory FreeGamesModel.fromJson(Map<String, dynamic> json) => FreeGamesModel(
//         id: json["id"],
//         title: json["title"],
//         worth: json["worth"],
//         thumbnail: json["thumbnail"],
//         image: json["image"],
//         type: json['type'],
//         description: json["description"],
//         instructions: json["instructions"],
//         openGiveawayUrl: json["open_giveaway_url"],
//         publishedDate: json['published_date'],
//         platforms: json["platforms"],
//         endDate: json["end_date"],
//         users: json["users"],
//         gamerpowerUrl: json["gamerpower_url"],
//         openGiveaway: json["open_giveaway"],
//       );
// }

class FreeGamesModel {
  String? title;
  String? worth;
  String? image;
  String? description;
  String? instructions;
  String? openGiveawayUrl;
  String? publishedDate;
  String? type;
  String? platforms;
  String? endDate;

  FreeGamesModel({
    this.title,
    this.worth,
    this.image,
    this.description,
    this.instructions,
    this.openGiveawayUrl,
    this.publishedDate,
    this.type,
    this.platforms,
    this.endDate,
  });

  FreeGamesModel.fromJson(Map<String, dynamic> json) {
    title = json['title'] ?? "N/A";
    worth = json['worth'] ?? "0";
    image = json['image'];
    description = json['description'] ?? "N/A";
    instructions = json['instructions'] ?? "N/A";
    openGiveawayUrl = json['open_giveaway_url'];
    publishedDate = json['published_date'];
    type = json['type'] ?? "N/A";
    platforms = json['platforms'] ?? "N/A";
    endDate = json['end_date'] ?? "N/A";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['title'] = title;
    data['worth'] = worth;
    data['image'] = image;
    data['description'] = description;
    data['instructions'] = instructions;
    data['open_giveaway_url'] = openGiveawayUrl;
    data['published_date'] = publishedDate;
    data['type'] = type;
    data['platforms'] = platforms;
    data['end_date'] = endDate;

    return data;
  }
}
