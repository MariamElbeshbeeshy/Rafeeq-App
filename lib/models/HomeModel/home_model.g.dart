// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HomeModelAdapter extends TypeAdapter<HomeModel> {
  @override
  final int typeId = 100;

  @override
  HomeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HomeModel(
      statusCode: fields[0] as int,
      key: fields[1] as String,
      message: fields[2] as dynamic,
      data: fields[3] as HomeDataModel,
    );
  }

  @override
  void write(BinaryWriter writer, HomeModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.statusCode)
      ..writeByte(1)
      ..write(obj.key)
      ..writeByte(2)
      ..write(obj.message)
      ..writeByte(3)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
