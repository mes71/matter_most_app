import 'package:hive/hive.dart';
import 'package:matter_most_app/data/server/model/responses/User_teams.dart';

part 'team_db_models.g.dart';

@HiveType(typeId: 2)
class TeamDbModels extends HiveObject {
  @HiveField(1)
  String? id;

  @HiveField(2)
  String? displayName;

  @HiveField(3)
  String? name;

  @HiveField(4)
  String? description;

  @HiveField(5)
  String? type;

  @HiveField(6)
  String? companyName;

  @HiveField(7)
  String? allowedDomains;

  @HiveField(8)
  String? inviteId;

  @HiveField(9)
  bool? allowOpenInvite;

  @HiveField(10)
  int? lastTeamIconUpdate;

  @HiveField(11)
  bool? cloudLimitsArchived;
}

TeamDbModels teamDbModelsFromRemote(UserTeams userTeams) {
  TeamDbModels teamDbModels = TeamDbModels();

  teamDbModels.id = userTeams.id;
  teamDbModels.name = userTeams.name;
  teamDbModels.type = userTeams.type;
  teamDbModels.allowedDomains = userTeams.allowedDomains;
  teamDbModels.allowOpenInvite = userTeams.allowOpenInvite;
  teamDbModels.cloudLimitsArchived = userTeams.cloudLimitsArchived;
  teamDbModels.companyName = userTeams.companyName;
  teamDbModels.description = userTeams.description;
  teamDbModels.displayName = userTeams.displayName;
  teamDbModels.inviteId = userTeams.inviteId;
  teamDbModels.lastTeamIconUpdate = userTeams.lastTeamIconUpdate;

  return teamDbModels;
}
