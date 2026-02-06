import 'package:rafeeq_app/models/user_data_model.dart';

class AuthResponseModel {
  final int statusCode;
  final String key;
  final String message;
  final dynamic data;

  AuthResponseModel({
    required this.statusCode,
    required this.key,
    required this.message,
    required this.data,
  });

  factory AuthResponseModel.logInResponse(Map<String, dynamic> json) {
    return AuthResponseModel(
      statusCode: json["statusCode"],
      key: json["key"],
      message: json["message"],
      data: json["data"] ,   // data is bool and could be null in login response
    );
  }

  factory AuthResponseModel.confirmCodeResponse(
    Map<String, dynamic> json,
  ) {
    return AuthResponseModel(
      statusCode: json["statusCode"],
      key: json["key"],
      message: json["message"],
      data: UserDataModel.fromJson(json["data"]),
    );
  }
}
