import 'package:rafeeq_app/models/option_model.dart';

class QuestionModel {
  final String id;
  final String text;
  final String? imageUrl; 
  final String? audioUrl;
  final List<OptionModel> options;

  QuestionModel({
    required this.id,
    required this.text,
    this.imageUrl,
    this.audioUrl,
    required this.options,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      id: json['id'] ?? '',
      text: json['text'] ?? '',
      imageUrl: json['imageUrl'],
      audioUrl: json['audioUrl'],
      options: json['options'] != null
          ? List<OptionModel>.from(
              json['options'].map((x) => OptionModel.fromJson(x)),
            )
          : [],
    );
  }
}