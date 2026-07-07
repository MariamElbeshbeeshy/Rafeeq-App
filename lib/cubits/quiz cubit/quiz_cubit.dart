import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:rafeeq_app/models/GamePlayModels/finalize_stage_response.dart';
import 'package:rafeeq_app/models/GamePlayModels/questions_model.dart';
import 'package:dio/dio.dart';
import 'package:rafeeq_app/models/GamePlayModels/quiz_stage_response_model.dart';
import 'package:rafeeq_app/services/user_local_services.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  final Dio _dio = Dio();
  String baseUrl = "https://api-rafiq.runasp.net/api/v1/placement-test";
  late final String? token;

  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;

  QuizCubit() : super(QuizInitial()) {
    token = UserLocalServices().getToken();
  }

  int _currentQuestionIndex = 0;
  int? _currentSelectedIndex;
  String _sessionId = "";
  List<QuestionModel> _allStageQuestions = [];
  String _skillName = "";

  void selectAnswer(int index) {
    _currentSelectedIndex = index;
    _emitCurrentQuestion();
  }

  Future<void> toggleAudio(String url) async {
    try {
      if (_isPlaying) {
        await _audioPlayer.pause();
        _isPlaying = false;
      } else {
        await _audioPlayer.play(UrlSource(url));
        _isPlaying = true;
      }
      emit(AudioPlayingState(_isPlaying));
    } catch (e) {
      print("Error playing audio: $e");
    }
  }

  Future<void> fetchStageQuestions() async {
    emit(QuizLoadingStage());
    try {
      final response = await _dio.get(
        "$baseUrl/questions",
        options: Options(
          headers: {"Accept-Language": "ar", "Authorization": "Bearer $token"},
        ),
      );

      if (response.statusCode == 200 && response.data != null) {
        final Map<String, dynamic> responseData = response.data['data'];
        final quizData = QuizStageResponseModel.fromJson(responseData);

        _allStageQuestions = quizData.questions;
        _sessionId = quizData.sessionId;
        _currentQuestionIndex = 0;
        _currentSelectedIndex = null;
        _skillName = quizData.skillName;
        _emitCurrentQuestion();
      }
    } on DioException catch (e) {
      String errorMsg = "حدث خطأ في تحميل الأسئلة";
      if (e.response != null && e.response!.data != null) {
        errorMsg = e.response!.data['message'] ?? errorMsg;
      }
      emit(QuizError(errorMsg));
    } catch (e) {
      emit(QuizError("حدث خطأ غير متوقع: ${e.toString()}"));
    }
  }

  Future<void> submitAnswerAndNext() async {
    if (_currentSelectedIndex == null) {
      emit(QuizError("اختر إجابة قبل المتابعة."));
      return;
    }

    try {
      final currentQuestion = _allStageQuestions[_currentQuestionIndex];
      final selectedAnswerId =
          currentQuestion.options[_currentSelectedIndex!].id;

      final response = await _dio.post(
        "$baseUrl/submit",
        options: Options(
          headers: {"Accept-Language": "ar", "Authorization": "Bearer $token"},
        ),
        data: {
          "sessionId": _sessionId,
          "questionId": currentQuestion.id,
          "selectedAnswerId": selectedAnswerId,
        },
      );
      debugPrint("Submit Response: ${response.data}");

      if (response.statusCode == 200) {
        if (_currentQuestionIndex < _allStageQuestions.length - 1) {
          _currentQuestionIndex++;
          _currentSelectedIndex = null;
          _emitCurrentQuestion();
        } else {
          await _finalizeCurrentStage();
        }
      }
    } on DioException catch (e) {
      debugPrint("Submit Error: ${e.message}");
      if (e.response != null &&
          e.response!.data != null &&
          e.response!.data['message'] == "تمت الإجابة على هذا السؤال بالفعل") {
        if (_currentQuestionIndex < _allStageQuestions.length - 1) {
          _currentQuestionIndex++;
          _emitCurrentQuestion();
        } else {
          await _finalizeCurrentStage();
        }
      } else {
        String errorMsg = "فشل في تسليم الإجابة";
        if (e.response != null && e.response!.data != null) {
          errorMsg = e.response!.data['message'] ?? errorMsg;
        }
        emit(QuizError(errorMsg));
      }
    }
  }

  Future<void> _finalizeCurrentStage() async {
    emit(QuizLoadingStage());
    try {
      final response = await _dio.post(
        "$baseUrl/finalize-stage",
        options: Options(
          headers: {"Accept-Language": "ar", "Authorization": "Bearer $token"},
        ),
        data: {"sessionId": _sessionId},
      );

      if (response.statusCode == 200 && response.data != null) {
        final finalizeData = FinalizeStageResponse.fromJson(response.data);

        if (finalizeData.nextState == 1) {
          await fetchStageQuestions();
        } else if (finalizeData.nextState == 2) {
          emit(QuizSuccessFinished());
        } else {
          emit(QuizError("حالة تقدم غير معروفة من السيرفر"));
        }
      }
    } on DioException catch (e) {
      String errorMsg = "فشل في إنهاء المرحلة الحالية";
      if (e.response != null && e.response!.data != null) {
        errorMsg = e.response!.data['message'] ?? errorMsg;
      }
      emit(QuizError(errorMsg));
    }
  }

  void _emitCurrentQuestion() {
    emit(
      QuizDisplayQuestion(
        stageQuestions: _allStageQuestions,
        currentQuestionIndex: _currentQuestionIndex,
        sessionId: _sessionId,
        skillName: _skillName,
        currentSelectedIndex: _currentSelectedIndex,
      ),
    );
  }

  @override
  Future<void> close() {
    _audioPlayer.dispose();
    return super.close();
  }
}
