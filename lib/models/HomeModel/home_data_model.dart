import 'package:hive/hive.dart';

import 'header_info_model.dart';
import 'level_list_model.dart';
import 'streak_info_model.dart';

part 'home_data_model.g.dart';

@HiveType(typeId: 101)
class HomeDataModel extends HiveObject {
  @HiveField(0)
  final HeaderInfo headerInfo;
  @HiveField(1)
  final List<StreakInfo> streakInfo;
  @HiveField(2)
  final List<LevelsList> levelsList;

  HomeDataModel({
    required this.headerInfo,
    required this.streakInfo,
    required this.levelsList,
  });

  factory HomeDataModel.fromJson(Map<String, dynamic> json) => HomeDataModel(
        headerInfo: HeaderInfo.fromJson(json['headerInfo']),
        streakInfo: List<StreakInfo>.from(json['streakInfo'].map((x) => StreakInfo.fromJson(x))),
        levelsList: List<LevelsList>.from(json['levelsList'].map((x) => LevelsList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'headerInfo': headerInfo.toJson(),
        'streakInfo': List<dynamic>.from(streakInfo.map((x) => x.toJson())),
        'levelsList': List<dynamic>.from(levelsList.map((x) => x.toJson())),
      };

  
}
