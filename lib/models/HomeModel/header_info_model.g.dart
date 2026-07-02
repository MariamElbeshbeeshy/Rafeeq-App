// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'header_info_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HeaderInfoAdapter extends TypeAdapter<HeaderInfo> {
  @override
  final int typeId = 102;

  @override
  HeaderInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HeaderInfo(
      currentLevelId: fields[0] as int,
      points: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, HeaderInfo obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.currentLevelId)
      ..writeByte(1)
      ..write(obj.points);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HeaderInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
