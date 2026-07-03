class LevelResultModel {
  final int levelId;
  final int correctAnswers;
  final int totalQuestions;
  final double scorePercentage; 
  final bool leveledUp;
  final int newLevelId;
  final String newLevelTitle;

  LevelResultModel({
    required this.levelId,
    required this.correctAnswers,
    required this.totalQuestions,
    required this.scorePercentage,
    required this.leveledUp,
    required this.newLevelId,
    required this.newLevelTitle,
  });

  factory LevelResultModel.fromJson(Map<String, dynamic> json) {
    return LevelResultModel(
      levelId: json['levelId'] ?? 0,
      correctAnswers: json['correctAnswers'] ?? 0,
      totalQuestions: json['totalQuestions'] ?? 0,
      scorePercentage: (json['scorePercentage'] ?? 0).toDouble(),
      leveledUp: json['leveledUp'] ?? false,
      newLevelId: json['newLevelId'] ?? 0,
      newLevelTitle: json['newLevelTitle'] ?? '',
    );
  }
}