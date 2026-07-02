part of 'game_play_cubit.dart';

@immutable
sealed class GamePlayState {}

final class GamePlayInitial extends GamePlayState {}

final class GamePlayLoadingStage extends GamePlayState {}

final class GamePlayError extends GamePlayState {
  final String message;
  GamePlayError(this.message);
}

final class GamePlayDisplayQuestion extends GamePlayState {
  final List<QuestionModel> stageQuestions;
  final int currentQuestionIndex;
  final String sessionId;
  final int? currentSelectedIndex;

  GamePlayDisplayQuestion({
    required this.stageQuestions,
    required this.currentQuestionIndex,
    required this.sessionId,
    this.currentSelectedIndex,
  });
}

class QuestionsCorrectAnswer extends GamePlayState {
  final String feedbackMessage;
  QuestionsCorrectAnswer(this.feedbackMessage);
}

class QuestionsWrongAnswer extends GamePlayState {
  final String feedbackMessage;
  QuestionsWrongAnswer(this.feedbackMessage);
}

final class GamePlayFinished extends GamePlayState {}