import 'package:hive/hive.dart';

part 'option_model.g.dart';

@HiveType(typeId: 3)
class OptionModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String text;

  OptionModel({
    required this.id,
    required this.text,
  });

  factory OptionModel.fromJson(Map<String, dynamic> json) {
    return OptionModel(
      id: json['id'] ?? '',
      text: json['text'] ?? '',
    );
  }
}