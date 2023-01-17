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
      ..id = fields[1] as String?
      ..username = fields[2] as String?
      ..email = fields[3] as String?
      ..nickname = fields[4] as String?
      ..firstName = fields[5] as String?
      ..lastName = fields[6] as String?
      ..position = fields[7] as String?
      ..roles = fields[8] as String?
      ..allowMarketing = fields[9] as bool?;
  }

  @override
  void write(BinaryWriter writer, UserDBModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.username)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.nickname)
      ..writeByte(5)
      ..write(obj.firstName)
      ..writeByte(6)
      ..write(obj.lastName)
      ..writeByte(7)
      ..write(obj.position)
      ..writeByte(8)
      ..write(obj.roles)
      ..writeByte(9)
      ..write(obj.allowMarketing);
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
