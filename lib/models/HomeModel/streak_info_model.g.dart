// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'streak_info_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StreakInfoAdapter extends TypeAdapter<StreakInfo> {
  @override
  final int typeId = 104;

  @override
  StreakInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StreakInfo(
      date: fields[0] as DateTime,
      dayName: fields[1] as String,
      isCompleted: fields[2] as bool,
      isToday: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, StreakInfo obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.dayName)
      ..writeByte(2)
      ..write(obj.isCompleted)
      ..writeByte(3)
      ..write(obj.isToday);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StreakInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
