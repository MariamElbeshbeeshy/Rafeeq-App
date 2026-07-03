//import 'dart:nativewrappers/_internal/vm/lib/developer.dart';
import 'package:dio/dio.dart';
import 'package:rafeeq_app/models/auth_response_model.dart';

class AuthService {
 final dio = Dio();
 
  String baseUrl = 'https://api-rafiq.runasp.net/api/v1';

  Future logIn({
    String? id,
    String? nationalityId,
    required String deviceId,
    required int deviceType,
  }) async {
    try {
      final Response response = await dio.post(
        '$baseUrl/Login',
        data: {
          "id": id,
          "nationalityId": nationalityId,
          "device": {"deviceId": deviceId, "deviceType": deviceType},
        },
        

        options: Options(
          headers: {"Content-Type": "application/json"},
          connectTimeout: Duration(minutes: 1),
          sendTimeout: Duration(minutes: 1),
          receiveTimeout: Duration(minutes: 1)
          ),
      );
      return AuthResponseModel.logInResponse(response.data);
    } on DioException {
      rethrow;
    }
  }

  Future nationalIdLogIn({
    String? nationalityId,
    required String deviceId,
    required int deviceType,
  }) async {
    try {
      final Response response = await dio.post(
         'https://api-rafiq.runasp.net/api/v1/Login',
        data: {
          "nationalityId": nationalityId,
          "device": {"deviceId": deviceId, "deviceType": deviceType},
        },
       );
      return AuthResponseModel.logInResponse(response.data);
    } on DioException {
      rethrow;
    }
  }

  Future confirmCode({
    String? id,
    String? nationalityId,
    String? otpCode,
  }) async {
    try {
      final Response response = await dio.post(
        "$baseUrl/ConfirmCode",
        data: {"id": id, "nationalityId": nationalityId, "code": otpCode},
        options: Options(
          headers: {
            "accept": 'text/plain',
            "Accept-Language": 'ar',
            "Content-Type": "application/json",
          },
        ),
      );
      return AuthResponseModel.confirmCodeResponse(response.data);
    } on DioException {
      rethrow;
    }
  }
}
