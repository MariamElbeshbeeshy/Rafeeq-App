import 'package:rafeeq_app/models/GamePlayModels/option_model.dart';
import 'package:hive/hive.dart';
import 'package:rafeeq_app/models/GamePlayModels/question_content_type.dart';

part 'questions_model.g.dart';



@HiveType(typeId: 1)
class QuestionModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final QuestionContentType type;

  @HiveField(2)
  final List<String> content;

  @HiveField(3)
  final String text;

  @HiveField(4)
  final String? audioUrl;

  @HiveField(5)
  final List<OptionModel> options;

  QuestionModel({
    required this.id,
    required this.type,
    required this.content,
    required this.text,
    this.audioUrl,
    required this.options,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    int typeId = json['type'] ?? 0;
    return QuestionModel(
      id: json['id'] ?? '',
      type: QuestionContentType.values.toList()[typeId],
      content: json['content'] != null
          ? List<String>.from(json['content'])
          : [],
      text: json['text'] ?? '',
      audioUrl: json['audioUrl'],
      options: json['options'] != null
          ? List<OptionModel>.from(
              json['options'].map((x) => OptionModel.fromJson(x)),
            )
          : [],
    );
  }
}
