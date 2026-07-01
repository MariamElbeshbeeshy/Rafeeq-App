import 'package:rafeeq_app/models/option_model.dart';

enum QuestionContentType {
  word, 
  emoji,    
  passage, 
}

class QuestionModel {
  final String id;
  final QuestionContentType type;
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
