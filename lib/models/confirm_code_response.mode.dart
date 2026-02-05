import 'package:rafeeq_app/models/user_data_model.dart';
class ConfirmCodeResponseModel {
  final int statusCode;
  final String key; 
  final String message;
  final UserDataModel data;

  ConfirmCodeResponseModel({required this.statusCode, required this.key, required this.message, required this.data});

  factory ConfirmCodeResponseModel.fromJson(Map<String , dynamic>json){

     return ConfirmCodeResponseModel(
      statusCode: json["statusCode"],
      key: json["key"],
      message : json["message"],
      data:  UserDataModel.fromJson(json["data"])
     );

  }

}