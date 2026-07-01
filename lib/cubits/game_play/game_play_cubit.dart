import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rafeeq_app/models/questions_model.dart';
import 'package:rafeeq_app/models/quiz_stage_response_model.dart';
import 'package:rafeeq_app/services/user_local_services.dart';

part 'game_play_state.dart';

class GamePlayCubit extends Cubit<GamePlayState> {
  String baseUrl = "https://api-rafiq.runasp.net/api/v1/gameplay";
  final String token = UserLocalServices().getToken()!;
  final Dio dio = Dio();

  GamePlayCubit() : super(GamePlayInitial());

  int levelId = 1;
  int _currentQuestionIndex = 0;
  String _sessionId = "";
  List<QuestionModel> _gamePlayQuestions = [];
  String _skillName = "";

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

  Future<void> startSession() async {
    emit(GamePlayLoadingStage());
    try {
      final response = await dio.get(
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
        fetchQuestions();
      }
    } on DioException catch (e) {
      emit(
        GamePlayError(
          "${e.response?.data['message'] ?? 'حدث خطأ أثناء بدء الجلسة'}",
        ),
      );
    }
  }

  Future<void> fetchQuestions() async {
    emit(GamePlayLoadingStage());
    try {
      final response = await dio.get(
        "$baseUrl/levels/$levelId/questions",
        options: Options(
          headers: {"Accept-Language": "ar", "Authorization": "Bearer $token"},
        ),
      );
      if (response.statusCode == 200 && response.data != null) {
        final Map<String, dynamic> responseData = response.data['data'];
        _gamePlayQuestions = (responseData as List)
            .map((questionJson) => QuestionModel.fromJson(questionJson))
            .toList();
        _currentQuestionIndex = 0;
        emit(
          GamePlayDisplayQuestion(
            stageQuestions: _gamePlayQuestions,
            currentQuestionIndex: _currentQuestionIndex,
            sessionId: _sessionId,
          ),
        );
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

  Future<void> submitAnswerAndNext(String selectedAnswerId) async {
    try {
      final QuestionModel currentQuestion =
          _gamePlayQuestions[_currentQuestionIndex];

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
        if (_currentQuestionIndex < _gamePlayQuestions.length - 1) {
          _currentQuestionIndex++;
          emit(
            GamePlayDisplayQuestion(
              stageQuestions: _gamePlayQuestions,
              currentQuestionIndex: _currentQuestionIndex,
              sessionId: _sessionId,
            ),
          );
        } else {
          //await finalizeCurrentStage();
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

  Future<void> completeStage() async {
    try {
      final response = await dio.post(
        "$baseUrl/levels/$levelId/complete",
        data: {"sessionId": _sessionId},
        options: Options(
          headers: {"Accept-Language": "ar", "Authorization": "Bearer $token"},
        ),
      );

      if (response.statusCode == 200 && response.data != null) {
        emit(GamePlayFinished());
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
