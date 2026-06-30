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

  int calculateCurrentStreak(List<StreakInfo> streakDays) {
    streakDays.sort((a, b) => a.date.compareTo(b.date));

    int currentStreak = 0;

    for (int i = streakDays.length - 1; i >= 0; i--) {
      final day = streakDays[i];

      if (day.isCompleted) {
        currentStreak++;
      } else {
        if (day.isToday) {
          continue;
        } else {
          currentStreak = 0;
          break;
        }
      }
    }
    return currentStreak;
  }
}
