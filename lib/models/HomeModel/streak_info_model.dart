import 'package:hive/hive.dart';

part 'streak_info_model.g.dart';

@HiveType(typeId: 104)
class StreakInfo extends HiveObject {
  @HiveField(0)
  final DateTime date;
  @HiveField(1)
  final String dayName;
  @HiveField(2)
  final bool isCompleted;
  @HiveField(3)
  final bool isToday;

  StreakInfo({
    required this.date,
    required this.dayName,
    required this.isCompleted,
    required this.isToday,
  });

  factory StreakInfo.fromJson(Map<String, dynamic> json) => StreakInfo(
        date: DateTime.parse(json['date']),
        dayName: json['dayName'],
        isCompleted: json['isCompleted'],
        isToday: json['isToday'],
      );

  Map<String, dynamic> toJson() => {
        'date': date.toIso8601String(),
        'dayName': dayName,
        'isCompleted': isCompleted,
        'isToday': isToday,
      };
}