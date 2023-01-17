import 'package:matter_most_app/data/db/app_db.dart';
import 'package:matter_most_app/data/db/model/user/user_db_model.dart';
import 'package:matter_most_app/data/db/model/user/user_team/team_db_models.dart';

abstract class ILocalDataSource {
  void writeCommonDataSource(
      {required String userName,
      required String password,
      required String userID,
      required String teamId,
      required String teamName,
      required String token});

  String readTokenDataSource();

  void writeUserDataSource(UserDBModel userDBModel);

  UserDBModel readUserDataSource();

  void writeTeamDataSource(TeamDbModels teamDbModel);

  TeamDbModels readTeamDataSource();

  void writeListOfUserDataSource(List<UserDBModel> userDbModels);

  List<dynamic> readListOfUserDataSource();
}

class LocalDataSource implements ILocalDataSource {
  @override
  String readTokenDataSource() => readToken();

  @override
  void writeCommonDataSource(
          {required String userName,
          required String userID,
          required String password,
          required String teamId,
          required String teamName,
          required String token}) =>
      writeCommonData(
          userName: userName,
          password: password,
          token: token,
          userID: userID,
          teamId: teamId,
          teamName: teamName);

  @override
  void writeTeamDataSource(TeamDbModels teamDbModel) =>
      writeTeamData(teamDbModel);

  @override
  void writeUserDataSource(UserDBModel userDBModel) =>
      writeLoginData(userDBModel);

  @override
  TeamDbModels readTeamDataSource() => readTeamData();

  @override
  UserDBModel readUserDataSource() => readLoginData();

  @override
  List<dynamic> readListOfUserDataSource() => readListOfUsers();

  @override
  void writeListOfUserDataSource(List<UserDBModel> userDbModels) async =>
      await writeListOfUser(userDbModels);
}

ILocalDataSource localDataSource = LocalDataSource();
