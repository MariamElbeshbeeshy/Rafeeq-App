import 'package:rafeeq_app/models/GamePlayModels/option_model.dart';
import 'package:rafeeq_app/models/GamePlayModels/questions_model.dart';

class LibraryItemModel extends QuestionModel {
  final String entryId;
  final String questionId;
  final int source;
  final String addedAt;
  final int levelId;
  final String levelTitle;
  final String answerId;

  LibraryItemModel({
    required super.id,
    required super.type,
    required super.content,
    required super.text,
    super.audioUrl,
    required super.options,
    required this.entryId,
    required this.questionId,
    required this.source,
    required this.addedAt,
    required this.levelId,
    required this.levelTitle,
    required this.answerId,
  });

  factory LibraryItemModel.fromJson(Map<String, dynamic> json) {
    int typeId = json['type'] ?? 0;

    return LibraryItemModel(
      id: json['questionId'] ?? '', 
      type: QuestionContentType.values[typeId],
      content: json['content'] != null ? List<String>.from(json['content']) : [],
      text: json['text'] ?? '',
      audioUrl: json['audioUrl'],
      options: json['options'] != null
          ? List<OptionModel>.from(
              json['options'].map((x) => OptionModel.fromJson(x)),
            )
          : [],
      entryId: json['entryId'] ?? '',
      questionId: json['questionId'] ?? '',
      source: json['source'] ?? 0,
      addedAt: json['addedAt'] ?? '',
      levelId: json['levelId'] ?? 0,
      levelTitle: json['levelTitle'] ?? '',
      answerId: json['answerId'] ?? '',
    );
  }
}