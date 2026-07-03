import 'package:rafeeq_app/models/GamePlayModels/questions_model.dart';
import 'package:hive/hive.dart';

part 'library_model.g.dart';

@HiveType(typeId: 4)
class LibraryItemModel {
  @HiveField(0)
  final String entryId;

  @HiveField(1)
  final String questionId;

  @HiveField(2)
  final int source;

  @HiveField(3)
  final String addedAt;

  @HiveField(4)
  final int levelId;

  @HiveField(5)
  final String levelTitle;

  @HiveField(6)
  final String answerId;

  @HiveField(7) // الـ Hive هيحفظ كائن الأسئلة بالكامل هنا لأن ليه Adapter جاهز
  final QuestionModel question;

  LibraryItemModel({
    required this.entryId,
    required this.questionId,
    required this.source,
    required this.addedAt,
    required this.levelId,
    required this.levelTitle,
    required this.answerId,
    required this.question,
  });

  factory LibraryItemModel.fromJson(Map<String, dynamic> json) {
    return LibraryItemModel(
      entryId: json['entryId'] ?? '',
      questionId: json['questionId'] ?? '',
      source: json['source'] ?? 0,
      addedAt: json['addedAt'] ?? '',
      levelId: json['levelId'] ?? 0,
      levelTitle: json['levelTitle'] ?? '',
      answerId: json['answerId'] ?? '',
      question: QuestionModel.fromJson(json), 
    );
  }
}