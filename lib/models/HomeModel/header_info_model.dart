import 'package:hive/hive.dart';

part 'header_info_model.g.dart';

@HiveType(typeId: 102)
class HeaderInfo extends HiveObject {
  @HiveField(0)
  final int currentLevelId;
  @HiveField(1)
  final int points;

  HeaderInfo({
    required this.currentLevelId,
    required this.points,
  });

  factory HeaderInfo.fromJson(Map<String, dynamic> json) => HeaderInfo(
        currentLevelId: json['currentLevelId'],
        points: json['points'],
      );

  Map<String, dynamic> toJson() => {
        'currentLevelId': currentLevelId,
        'points': points,
      };
}