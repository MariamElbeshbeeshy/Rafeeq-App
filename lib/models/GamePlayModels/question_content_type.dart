import 'package:hive/hive.dart';

part 'question_content_type.g.dart';


@HiveType(typeId: 2)
enum QuestionContentType {
  @HiveField(0)
  none,

  @HiveField(1)
  passage,

  @HiveField(2)
  word,

  @HiveField(3)
  emoji,

  @HiveField(4)
  wordList,

  @HiveField(5)
  confusedPair,

  @HiveField(6)
  wordIncomplete,

  @HiveField(7)
  letterPositions,

  @HiveField(8)
  wordDisplay,
}