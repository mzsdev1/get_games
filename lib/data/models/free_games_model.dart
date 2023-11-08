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
