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
  final int? currentSelectedIndex;

  QuizDisplayQuestion({
    required this.stageQuestions,
    required this.currentQuestionIndex,
    required this.sessionId,
    required this.skillName,
    this.currentSelectedIndex,
  });
}

class QuizSubmittingAnswer extends QuizState {}

class QuizSuccessFinished extends QuizState {}

class QuizError extends QuizState {
  final String message;
  QuizError(this.message);
}

class AudioPlayingState extends QuizState {
  final bool isPlaying;
  AudioPlayingState(this.isPlaying);
}
