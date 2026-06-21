import 'package:hive/hive.dart';

part 'user_data_model.g.dart';

@HiveType(typeId: 0)
class UserDataModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String firstName;

  @HiveField(2)
  final String lastName;

  @HiveField(3)
  final String birthDate;

  @HiveField(4)
  final int? gender;

  @HiveField(5)
  final String nationalityId;

  @HiveField(6)
  final String? image;

  @HiveField(7)
  final int level;

  @HiveField(8)
  final String token;

  @HiveField(9)
  final int? points;

  @HiveField(10)
  final int? fontSize;

  @HiveField(11)
  final int? fontType;

  UserDataModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.birthDate,
    this.gender,
    required this.nationalityId,
    this.image,
    required this.level,
    required this.token,
    this.points,
    this.fontSize,
    this.fontType,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      birthDate: json['birthDate'],
      gender: json['gender'] ?? 0,
      nationalityId: json['nationalityId'],
      image: json['image'] ?? '',
      level: json['level'],
      token: json['token'],
      points: json['points'] ?? 0,
      fontSize: json['fontSize'] ?? 100,
      fontType: json['fontType'] ?? 1,
    );
  }
}