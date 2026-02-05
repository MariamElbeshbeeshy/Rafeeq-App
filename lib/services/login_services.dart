import 'dart:nativewrappers/_internal/vm/lib/developer.dart';
import 'package:dio/dio.dart';
import 'package:rafeeq_app/models/login_response_model.dart';

class LoginServices {
  final Dio dio =Dio();

  String baseUrl ="https://api-rafiq.premiumasp.net/api/v1";

   Future logIn ({String? id,String? nationalityId, required String deviceId, required String deviceName, required String projectName }) async{

    try {
  final Response response = await dio.post(
    "$baseUrl/Login",
    data: {
      "id" :id ,
      "nationalityId": nationalityId,
      "device": {
         "deviceId": deviceId,
          "deviceName": deviceName, 
          "projectName": projectName, 
          }
    }
  );
   return  LoginResponseModel.fromJson(response.data);
} on DioException catch (e) {
   log(e.toString());
   final String errorMessage = e.response?.data;
   throw Exception(errorMessage);
   }catch (e) {  
    print("Unexpected Error: $e"); }
}
}
