class FreeGamesModel {
  final int id;
  final String title;
  final String worth;
  final String thumbnail;
  final String image;
  final String description;
  final String instructions;
  final String openGiveawayUrl;
  final String publishedDate;
  final String platforms;
  final String endDate;
  final int users;
  final String gamerpowerUrl;
  final String openGiveaway;

  const FreeGamesModel({
    required this.id,
    required this.title,
    required this.worth,
    required this.thumbnail,
    required this.image,
    required this.description,
    required this.instructions,
    required this.openGiveawayUrl,
    required this.publishedDate,
    required this.platforms,
    required this.endDate,
    required this.users,
    required this.gamerpowerUrl,
    required this.openGiveaway,
  });

  factory FreeGamesModel.fromJson(Map<String, dynamic> json) => FreeGamesModel(
        id: json["id"],
        title: json["title"],
        worth: json["worth"],
        thumbnail: json["thumbnail"],
        image: json["image"],
        description: json["description"],
        instructions: json["instructions"],
        openGiveawayUrl: json["open_giveaway_url"],
        publishedDate: json['published_date'],
        platforms: json["platforms"],
        endDate: json["end_date"],
        users: json["users"],
        gamerpowerUrl: json["gamerpower_url"],
        openGiveaway: json["open_giveaway"],
      );
}
