// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_db_models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TeamDbModelsAdapter extends TypeAdapter<TeamDbModels> {
  @override
  final int typeId = 2;

  @override
  TeamDbModels read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TeamDbModels()
      ..id = fields[1] as String?
      ..displayName = fields[2] as String?
      ..name = fields[3] as String?
      ..description = fields[4] as String?
      ..type = fields[5] as String?
      ..companyName = fields[6] as String?
      ..allowedDomains = fields[7] as String?
      ..inviteId = fields[8] as String?
      ..allowOpenInvite = fields[9] as bool?
      ..lastTeamIconUpdate = fields[10] as int?
      ..cloudLimitsArchived = fields[11] as bool?;
  }

  @override
  void write(BinaryWriter writer, TeamDbModels obj) {
    writer
      ..writeByte(11)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.displayName)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.type)
      ..writeByte(6)
      ..write(obj.companyName)
      ..writeByte(7)
      ..write(obj.allowedDomains)
      ..writeByte(8)
      ..write(obj.inviteId)
      ..writeByte(9)
      ..write(obj.allowOpenInvite)
      ..writeByte(10)
      ..write(obj.lastTeamIconUpdate)
      ..writeByte(11)
      ..write(obj.cloudLimitsArchived);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TeamDbModelsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
