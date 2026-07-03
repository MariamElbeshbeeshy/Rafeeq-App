// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'level_list_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LevelsListAdapter extends TypeAdapter<LevelsList> {
  @override
  final int typeId = 103;

  @override
  LevelsList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LevelsList(
      id: fields[0] as int,
      title: fields[1] as String,
      description: fields[2] as String,
      status: fields[3] as int,
      completionPercentage: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, LevelsList obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.status)
      ..writeByte(4)
      ..write(obj.completionPercentage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LevelsListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
