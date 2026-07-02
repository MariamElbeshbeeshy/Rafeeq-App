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
      // final Response response = await dio.post(
      //   "$baseUrl/ConfirmCode",
      //   data: {"id": id, "nationalityId": nationalityId, "code": otpCode},
      // );
      return AuthResponseModel.confirmCodeResponse({
  "statusCode": 200,
  "key": "success",
  "message": "تم التحقق بنجاح",
  "data": {
    "id": "91e5f3cc-875c-45e5-bb68-04680f720e73",
    "firstName": "سارة",
    "lastName": "إيهاب",
    "birthDate": "2017-07-01",
    "gender": 0,
    "nationalityId": "000001",
    "image": "https://localhost:7213/https://th.bing.com/th/id/OIP.gCNNRsV-IZ3Kt05lcDSOgQHaE8?w=259&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3",
    "level": 2,
    "points": 0,
    "fontSize": 100,
    "fontType": 1,
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjkxZTVmM2NjLTg3NWMtNDVlNS1iYjY4LTA0NjgwZjcyMGU3MyIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL25hbWUiOiLYs9in2LHYqSIsInR5cGVVc2VyIjoiUGFyZW50IiwiZXhwIjoxODE4OTcwNDE4LCJpc3MiOiJodHRwOi8vd3d3Lmdvb2dsZS5jb20iLCJhdWQiOiJodHRwOi8vd3d3Lmdvb2dsZS5jb20ifQ.-FqUevmONn3PtO9XxJyDi56MauW_onN7uTjGu-Dg5ro"
  }
});
    } on DioException {
      rethrow;
    }
  }
}
