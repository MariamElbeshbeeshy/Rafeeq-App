import 'package:rafeeq_app/models/user_data_model.dart';

class LoginResponseModel {
  final int statusCode;
  final String key; 
  final String message;
  final UserDataModel data;

  LoginResponseModel({required this.statusCode, required this.key, required this.message, required this.data});

  factory LoginResponseModel.fromJson(Map<String , dynamic>json){

     return LoginResponseModel(
      statusCode: json["statusCode"],
      key: json["key"],
      message : json["message"],
      data:  UserDataModel.fromJson(json["data"])
     );

  }

}
