import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rafeeq_app/models/finalize_stage_response.dart';
import 'package:rafeeq_app/models/questions_model.dart';
import 'package:dio/dio.dart';
import 'package:rafeeq_app/models/quiz_stage_response_model.dart';
import 'package:rafeeq_app/services/user_local_services.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  final Dio _dio = Dio();
  String baseUrl = "https://api-rafiq.runasp.net/api/v1/placement-test";
  late final String token;

  QuizCubit() : super(QuizInitial()) {
    token = UserLocalServices().getToken() ?? "";
  }

  int _currentQuestionIndex = 0;
  String _sessionId = "";
  List<QuestionModel> _allStageQuestions = [];
  String _skillName = "";

  Future<void> fetchStageQuestions() async {
    emit(QuizLoadingStage());
    try {
      final response = await _dio.get(
        "$baseUrl/questions",
        options: Options(
          headers: {
            "Accept-Language": "ar",
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (response.statusCode == 200 && response.data != null) {
        final Map<String, dynamic> responseData = response.data['data'];
        final quizData = QuizStageResponseModel.fromJson(responseData);

        _allStageQuestions = quizData.questions;
        _sessionId = quizData.sessionId;
        _currentQuestionIndex = 0;
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

  Future<void> submitAnswerAndNext(String selectedAnswerId) async {
    try {
      final currentQuestion = _allStageQuestions[_currentQuestionIndex];

      final response = await _dio.post(
        "$baseUrl/submit",
        options: Options(
          headers: {
            "Accept-Language": "ar",
            "Authorization": "Bearer $token",
          },
        ),
        data: {
          "sessionId": _sessionId,
          "questionId": currentQuestion.id,
          "selectedAnswerId": selectedAnswerId,
        },
      );

      if (response.statusCode == 200) {
        if (_currentQuestionIndex < _allStageQuestions.length - 1) {
          _currentQuestionIndex++;
          _emitCurrentQuestion();
        } else {
          await _finalizeCurrentStage();
        }
      }
    } on DioException catch (e) {
      String errorMsg = "فشل في تسليم الإجابة";
      if (e.response != null && e.response!.data != null) {
        errorMsg = e.response!.data['message'] ?? errorMsg;
      }
      emit(QuizError(errorMsg));
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
      ),
    );
  }
}
