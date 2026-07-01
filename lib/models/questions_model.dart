import 'package:rafeeq_app/models/option_model.dart';

class QuestionModel {
  final String id;
  final int type;
  final List<String> content;
  final String text;
  final String? audioUrl;
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
    return QuestionModel(
      id: json['id'] ?? '',
      type: json['type'] ?? 0,
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
