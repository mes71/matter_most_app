// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_db_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserDBModelAdapter extends TypeAdapter<UserDBModel> {
  @override
  final int typeId = 1;

  @override
  UserDBModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserDBModel()
      ..token = fields[1] as String?
      ..userName = fields[2] as String?
      ..password = fields[3] as String?;
  }

  @override
  void write(BinaryWriter writer, UserDBModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.token)
      ..writeByte(2)
      ..write(obj.userName)
      ..writeByte(3)
      ..write(obj.password);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserDBModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
