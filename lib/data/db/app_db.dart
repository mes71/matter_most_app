import 'package:hive_flutter/hive_flutter.dart';
import 'package:matter_most_app/data/db/model/user/user_db_model.dart';
import 'package:matter_most_app/data/db/model/user/user_team/team_db_models.dart';
import 'package:matter_most_app/data/db/utils.dart';

void writeCommonData(
    {required String userName,
    required String userID,
    required String password,
    required String teamId,
    required String teamName,
    required String token}) {
  var box = Hive.box(commonBox);

  box.put(userNameCommonBox, userName);
  box.put(userIDCommonBox, userID);
  box.put(passwordCommonBox, password);
  box.put(tokenCommonBox, token);
  box.put(teamIDCommonBox, teamId);
  box.put(teamNameCommonBox, teamName);
}

String readToken() {
  var box = Hive.box(commonBox);
  return box.get(tokenCommonBox);
}

void writeLoginData(UserDBModel userDBModel) {
  var box = Hive.box(userBox);

  box.put(authUserBox, userDBModel);
}

Future<void> writeListOfUser(List<UserDBModel> userDBModels) async {
  var box = Hive.box(listUserBox);
  box.clear();
  await box.addAll(userDBModels);
}

List<dynamic> readListOfUsers() {
  var box = Hive.box(listUserBox);

  return box.values.toList();
}

void writeTeamData(TeamDbModels teamDbModels) {
  var box = Hive.box(userBox);
  box.put(teamUserBox, teamDbModels);
}

UserDBModel readLoginData() {
  var box = Hive.box(userBox);
  return box.get(authUserBox);
}

TeamDbModels readTeamData() {
  var box = Hive.box(userBox);
  return box.get(teamUserBox);
}
