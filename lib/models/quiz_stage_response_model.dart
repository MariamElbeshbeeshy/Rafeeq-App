import 'package:rafeeq_app/models/questions_model.dart';

class QuizStageResponseModel {
  final String sessionId;
  final int currentLevelId;
  final String levelTitle;
  final List<QuestionModel> questions;

  QuizStageResponseModel({
    required this.sessionId,
    required this.currentLevelId,
    required this.levelTitle,
    required this.questions,
  });

  factory QuizStageResponseModel.fromJson(Map<String, dynamic> json) {
    return QuizStageResponseModel(
      sessionId: json['sessionId'] ?? '',
      currentLevelId: json['currentLevelId'] ?? 0,
      levelTitle: json['levelTitle'] ?? '',
      questions: json['questions'] != null
          ? List<QuestionModel>.from(
              json['questions'].map((x) => QuestionModel.fromJson(x)),
            )
          : [],
    );
  }
}