part of 'quiz_cubit.dart';

@immutable
sealed class QuizState {}

final class QuizInitial extends QuizState {}

class QuizLoadingStage extends QuizState {}

class QuizDisplayQuestion extends QuizState {
  final List<QuestionModel> stageQuestions; 
  final int currentQuestionIndex; 
  final String sessionId;
  final String skillName;

  QuizDisplayQuestion({
    required this.stageQuestions,
    required this.currentQuestionIndex,
    required this.sessionId,
    required this.skillName,
  });
}

class QuizSubmittingAnswer extends QuizState {}

class QuizSuccessFinished extends QuizState {}

class QuizError extends QuizState {
  final String message;
  QuizError(this.message);
}