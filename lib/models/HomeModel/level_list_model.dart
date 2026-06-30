import 'package:hive/hive.dart';

part 'level_list_model.g.dart';

@HiveType(typeId: 103)
class LevelsList extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final int status;
  @HiveField(4)
  final int completionPercentage;

  LevelsList({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.completionPercentage,
  });

  factory LevelsList.fromJson(Map<String, dynamic> json) => LevelsList(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        status: json['status'],
        completionPercentage: json['completionPercentage'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'status': status,
        'completionPercentage': completionPercentage,
      };
}