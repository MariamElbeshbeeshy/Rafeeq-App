
class LoginResponseModel {
  final int statusCode;
  final String key; 
  final String message;
  final bool? data;

  LoginResponseModel({required this.statusCode, required this.key, required this.message, required this.data});

  factory LoginResponseModel.fromJson(Map<String , dynamic>json){

     return LoginResponseModel(
      statusCode: json["statusCode"],
      key: json["key"],
      message : json["message"],
      data: json["data"]
     );

  }

}
