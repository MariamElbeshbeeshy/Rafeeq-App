class LevelModel {
  final String levelId;
  final String title;
  final int status;

  LevelModel({
    required this.levelId,
    required this.title,
    required this.status,
  });

  factory LevelModel.fromJson(Map<String, dynamic> json) {
    return LevelModel(
      levelId: json["levelId"],
      title: json["title"],
      status: json["status"],
    );
  }
}
