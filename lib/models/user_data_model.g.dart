// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserDataModelAdapter extends TypeAdapter<UserDataModel> {
  @override
  final int typeId = 0;

  @override
  UserDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserDataModel(
      id: fields[0] as String,
      firstName: fields[1] as String,
      lastName: fields[2] as String,
      birthDate: fields[3] as String,
      gender: fields[4] as int?,
      nationalityId: fields[5] as String,
      image: fields[6] as String?,
      level: fields[7] as int,
      token: fields[8] as String,
      points: fields[9] as int,
      fontSize: fields[10] as int,
      fontType: fields[11] as int,
    );
  }

  @override
  void write(BinaryWriter writer, UserDataModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.firstName)
      ..writeByte(2)
      ..write(obj.lastName)
      ..writeByte(3)
      ..write(obj.birthDate)
      ..writeByte(4)
      ..write(obj.gender)
      ..writeByte(5)
      ..write(obj.nationalityId)
      ..writeByte(6)
      ..write(obj.image)
      ..writeByte(7)
      ..write(obj.level)
      ..writeByte(8)
      ..write(obj.token)
      ..writeByte(9)
      ..write(obj.points)
      ..writeByte(10)
      ..write(obj.fontSize)
      ..writeByte(11)
      ..write(obj.fontType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
