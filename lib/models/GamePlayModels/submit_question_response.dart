class SubmitQuestionResponse {
  final bool isCorrect;
  final String feedbackMessage;
  final int pointsGained;
  final int totalCurrentPoints;
  final int answeredCount;
  final int totalQuestions;

  SubmitQuestionResponse({
    required this.isCorrect,
    required this.feedbackMessage,
    required this.pointsGained,
    required this.totalCurrentPoints,
    required this.answeredCount,
    required this.totalQuestions,
  });

  factory SubmitQuestionResponse.fromJson(Map<String, dynamic> json) {
    return SubmitQuestionResponse(
      isCorrect: json['isCorrect'] as bool,
      feedbackMessage: json['feedbackMessage'] as String,
      pointsGained: json['pointsGained'] as int,
      totalCurrentPoints: json['totalCurrentPoints'] as int,
      answeredCount: json['answeredCount'] as int,
      totalQuestions: json['totalQuestions'] as int,
    );
  }
}
