//import 'dart:nativewrappers/_internal/vm/lib/developer.dart';
import 'package:dio/dio.dart';
import 'package:rafeeq_app/models/auth_response_model.dart';

/// 3032158777

class AuthService {
  final Dio dio = Dio();

  String baseUrl = "https://api-rafiq.runasp.net/api/v1";

  Future logIn({
    String? id,
    String? nationalityId,
    required String deviceId,
    required String deviceName,
    
  }) async {
    try {
      final Response response = await dio.post(
        "$baseUrl/Login",
        data: {
          "id": id,
          "nationalityId": nationalityId,
          "device": {
            "deviceId": deviceId,
            "deviceName": deviceName,
          },
        },

        options: Options(headers: {"Content-Type": "application/json"}),
      );
      return AuthResponseModel.logInResponse(response.data);
    } on DioException {
      rethrow;
    }
  }

  Future nationalIdLogIn({
    String? id,
    String? nationalityId,
    required String deviceId,
    required String deviceName,
    required String projectName,
  }) async {
    try {
      final Response response = await dio.post(
        "$baseUrl/Login",
        data: {
          "id": id,
          "nationalityId": nationalityId,
          "device": {
            "deviceId": deviceId,
            "deviceName": deviceName,
            "projectName": projectName,
          },
        },

        options: Options(headers: {"Content-Type": "application/json"}),
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
      );
      return AuthResponseModel.confirmCodeResponse(response.data);
    } on DioException {
      rethrow;
    }
  }
}
