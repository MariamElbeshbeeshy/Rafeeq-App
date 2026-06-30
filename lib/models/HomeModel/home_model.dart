
import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:rafeeq_app/models/HomeModel/home_data_model.dart';

export 'level_list_model.dart';
export 'streak_info_model.dart';
export 'header_info_model.dart';
export 'home_data_model.dart';

part 'home_model.g.dart';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

@HiveType(typeId: 100)
class HomeModel extends HiveObject {
  @HiveField(0)
  final int statusCode;
  @HiveField(1)
  final String key;
  @HiveField(2)
  final dynamic message;
  @HiveField(3)
  final HomeDataModel data;

  HomeModel({
    required this.statusCode,
    required this.key,
    required this.message,
    required this.data,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        statusCode: json['statusCode'],
        key: json['key'],
        message: json['message'],
        data: HomeDataModel.fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => {
        'statusCode': statusCode,
        'key': key,
        'message': message,
        'data': data.toJson(),
      };
}







