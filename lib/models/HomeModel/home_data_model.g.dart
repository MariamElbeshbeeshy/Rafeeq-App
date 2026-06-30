// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HomeDataModelAdapter extends TypeAdapter<HomeDataModel> {
  @override
  final int typeId = 101;

  @override
  HomeDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HomeDataModel(
      headerInfo: fields[0] as HeaderInfo,
      streakInfo: (fields[1] as List).cast<StreakInfo>(),
      levelsList: (fields[2] as List).cast<LevelsList>(),
    );
  }

  @override
  void write(BinaryWriter writer, HomeDataModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.headerInfo)
      ..writeByte(1)
      ..write(obj.streakInfo)
      ..writeByte(2)
      ..write(obj.levelsList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
