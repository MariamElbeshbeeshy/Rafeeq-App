// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_content_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuestionContentTypeAdapter extends TypeAdapter<QuestionContentType> {
  @override
  final int typeId = 2;

  @override
  QuestionContentType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return QuestionContentType.none;
      case 1:
        return QuestionContentType.passage;
      case 2:
        return QuestionContentType.word;
      case 3:
        return QuestionContentType.emoji;
      case 4:
        return QuestionContentType.wordList;
      case 5:
        return QuestionContentType.confusedPair;
      case 6:
        return QuestionContentType.wordIncomplete;
      case 7:
        return QuestionContentType.letterPositions;
      case 8:
        return QuestionContentType.wordDisplay;
      default:
        return QuestionContentType.none;
    }
  }

  @override
  void write(BinaryWriter writer, QuestionContentType obj) {
    switch (obj) {
      case QuestionContentType.none:
        writer.writeByte(0);
        break;
      case QuestionContentType.passage:
        writer.writeByte(1);
        break;
      case QuestionContentType.word:
        writer.writeByte(2);
        break;
      case QuestionContentType.emoji:
        writer.writeByte(3);
        break;
      case QuestionContentType.wordList:
        writer.writeByte(4);
        break;
      case QuestionContentType.confusedPair:
        writer.writeByte(5);
        break;
      case QuestionContentType.wordIncomplete:
        writer.writeByte(6);
        break;
      case QuestionContentType.letterPositions:
        writer.writeByte(7);
        break;
      case QuestionContentType.wordDisplay:
        writer.writeByte(8);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuestionContentTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
