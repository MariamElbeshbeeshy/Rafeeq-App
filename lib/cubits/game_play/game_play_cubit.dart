import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rafeeq_app/models/level_result_model.dart';
import 'package:rafeeq_app/models/questions_model.dart';
import 'package:rafeeq_app/models/submit_question_response.dart';
import 'package:rafeeq_app/services/user_local_services.dart';

part 'game_play_state.dart';

class GamePlayCubit extends Cubit<GamePlayState> {
  String baseUrl = "https://api-rafiq.runasp.net/api/v1/gameplay";
  final String token = UserLocalServices().getToken()!;
  final Dio dio = Dio();

  GamePlayCubit() : super(GamePlayInitial());

  late int levelId;
  int _currentQuestionIndex = 0;
  int? _currentSelectedIndex;
  late String _sessionId;
  List<QuestionModel> _gamePlayQuestions = [];
  int _wrongAttemptsCount = 0;

  void selectAnswer(int index) {
    _currentSelectedIndex = index;
    _emitCurrentQuestion();
  }

  Future<void> toggleAudio(String url) async {
    // try {
    //   if (_isPlaying) {
    //     await _audioPlayer.pause();
    //     _isPlaying = false;
    //   } else {
    //     await _audioPlayer.play(UrlSource(url));
    //     _isPlaying = true;
    //   }
    //   emit(AudioPlayingState(_isPlaying));
    // } catch (e) {
    //   print("Error playing audio: $e");
    // }
  }

  Future<void> startSession(int levelId) async {
    this.levelId = levelId;
    emit(GamePlayLoadingStage());
    try {
      final response = await dio.post(
        "$baseUrl/levels/$levelId/start",
        options: Options(
          headers: {
            "Accept-Language": "ar",
            "Authorization": "Bearer $token",
            "accept": "text/plain",
          },
        ),
      );

      if (response.statusCode == 200 && response.data != null) {
        _sessionId = response.data['data']['sessionId'] ?? '';
        fetchQuestions(levelId);
      }
    } on DioException catch (e) {
      emit(
        GamePlayError(
          "${e.response?.data['message'] ?? 'حدث خطأ أثناء بدء الجلسة'}",
        ),
      );
    }
  }

  Future<void> fetchQuestions(int levelId) async {
    emit(GamePlayLoadingStage());
    try {
      final response = await dio.get(
        "$baseUrl/levels/$levelId/questions",
        options: Options(
          headers: {"Accept-Language": "ar", "Authorization": "Bearer $token"},
        ),
      );
      if (response.statusCode == 200 && response.data != null) {
        final List<dynamic> responseData =
            response.data['data'] as List<dynamic>;
        _gamePlayQuestions = responseData
            .map(
              (questionJson) =>
                  QuestionModel.fromJson(questionJson as Map<String, dynamic>),
            )
            .toList();
        _currentQuestionIndex = 0;
        _currentSelectedIndex = null;
        _wrongAttemptsCount = 0;
        _emitCurrentQuestion();
      }
    } on DioException catch (e) {
      emit(
        GamePlayError(
          "${e.response?.data['message'] ?? 'حدث خطأ أثناء تحميل الأسئلة'}",
        ),
      );
    } catch (e) {
      emit(GamePlayError("حدث خطأ غير متوقع: ${e.toString()}"));
    }
  }

  Future<void> submitAnswerAndNext() async {
    if (_currentSelectedIndex == null) {
      emit(GamePlayError("اختر إجابة قبل المتابعة."));
      return;
    }

    try {
      final QuestionModel currentQuestion =
          _gamePlayQuestions[_currentQuestionIndex];
      final selectedAnswerId =
          currentQuestion.options[_currentSelectedIndex!].id;

      Response response = await dio.post(
        "$baseUrl/answers/submit",
        data: {
          "sessionId": _sessionId,
          "questionId": currentQuestion.id,
          "selectedAnswerId": selectedAnswerId,
        },
        options: Options(
          headers: {"Accept-Language": "ar", "Authorization": "Bearer $token"},
        ),
      );

      if (response.statusCode == 200 && response.data != null) {
        final SubmitQuestionResponse submitResponse =
            SubmitQuestionResponse.fromJson(response.data['data']);

        if (submitResponse.isCorrect) {
          emit(QuestionsCorrectAnswer(submitResponse.feedbackMessage));
          await Future.delayed(const Duration(milliseconds: 2));
          _moveToNextOrComplete();
        } else {
          _wrongAttemptsCount++;
          emit(QuestionsWrongAnswer(submitResponse.feedbackMessage));
          await Future.delayed(const Duration(seconds: 2));

          if (_wrongAttemptsCount == 1) {
            _currentSelectedIndex = null;
            _emitCurrentQuestion();
          } else {
            _moveToNextOrComplete();
          }
        }
      }
    } on DioException catch (e) {
      emit(
        GamePlayError(
          "${e.response?.data['message'] ?? 'حدث خطأ أثناء إرسال الإجابة'}",
        ),
      );
    } catch (e) {
      emit(GamePlayError("حدث خطأ غير متوقع: ${e.toString()}"));
    }
  }

  void _moveToNextOrComplete() async {
    if (_currentQuestionIndex < _gamePlayQuestions.length - 1) {
      _currentQuestionIndex++;
      _currentSelectedIndex = null;
      _wrongAttemptsCount = 0;
      _emitCurrentQuestion();
    } else {
      await completeStage(levelId);
    }
  }

  void _emitCurrentQuestion() {
    emit(
      GamePlayDisplayQuestion(
        stageQuestions: _gamePlayQuestions,
        currentQuestionIndex: _currentQuestionIndex,
        sessionId: _sessionId,
        currentSelectedIndex: _currentSelectedIndex,
      ),
    );
  }

  Future<void> completeStage(int levelId) async {
    try {
      final response = await dio.post(
        "$baseUrl/levels/$levelId/complete?sessionId=$_sessionId",
        options: Options(
          headers: {"Accept-Language": "ar", "Authorization": "Bearer $token"},
        ),
      );

      if (response.statusCode == 200 && response.data != null) {
        final LevelResultModel result = LevelResultModel.fromJson(
          response.data["data"],
        );
        if (result.leveledUp == true) {
          emit(GamePlayFinished(result.scorePercentage));
        } else {
          emit(GamePlayError("لم يتم إكمال المرحلة بنجاح.\nحاول مرة أخرى."));
        }
      }
    } on DioException catch (e) {
      emit(
        GamePlayError(
          "${e.response?.data['message'] ?? 'حدث خطأ أثناء إنهاء المرحلة'}",
        ),
      );
    } catch (e) {
      emit(GamePlayError("حدث خطأ غير متوقع: ${e.toString()}"));
    }
  }
}
