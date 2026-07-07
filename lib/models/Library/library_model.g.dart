// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LibraryItemModelAdapter extends TypeAdapter<LibraryItemModel> {
  @override
  final int typeId = 4;

  @override
  LibraryItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LibraryItemModel(
      entryId: fields[0] as String,
      questionId: fields[1] as String,
      source: fields[2] as int,
      addedAt: fields[3] as String,
      levelId: fields[4] as int,
      levelTitle: fields[5] as String,
      answerId: fields[6] as String,
      question: fields[7] as QuestionModel,
    );
  }

  @override
  void write(BinaryWriter writer, LibraryItemModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.entryId)
      ..writeByte(1)
      ..write(obj.questionId)
      ..writeByte(2)
      ..write(obj.source)
      ..writeByte(3)
      ..write(obj.addedAt)
      ..writeByte(4)
      ..write(obj.levelId)
      ..writeByte(5)
      ..write(obj.levelTitle)
      ..writeByte(6)
      ..write(obj.answerId)
      ..writeByte(7)
      ..write(obj.question);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LibraryItemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
