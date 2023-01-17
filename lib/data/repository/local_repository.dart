import 'package:matter_most_app/data/db/model/user/user_db_model.dart';
import 'package:matter_most_app/data/db/model/user/user_team/team_db_models.dart';
import 'package:matter_most_app/data/source/local_datasource.dart';

abstract class ILocalRepository {
  void writeCommonDataRepository(
      {required String userName,
      required String userID,
      required String password,
      required String teamId,
      required String teamName,
      required String token});

  String readTokenRepository();

  void writeUserRepository(UserDBModel userDBModel);

  UserDBModel readUserRepository();

  void writeTeamRepository(TeamDbModels teamDbModel);

  TeamDbModels readTeamRepository();

  void writeListOfUserRepository(List<UserDBModel> userDbModels);

  List<dynamic> readListOfUserRepository();
}

class LocalRepository implements ILocalRepository {
  final ILocalDataSource dataSource;

  LocalRepository(this.dataSource);

  @override
  String readTokenRepository() => dataSource.readTokenDataSource();

  @override
  void writeCommonDataRepository(
          {required String userName,
          required String userID,
          required String password,
          required String teamId,
          required String teamName,
          required String token}) =>
      dataSource.writeCommonDataSource(
          userName: userName,
          password: password,
          token: token,
          userID: userID,
          teamId: teamId,
          teamName: teamName);

  @override
  TeamDbModels readTeamRepository() => dataSource.readTeamDataSource();

  @override
  UserDBModel readUserRepository() => dataSource.readUserDataSource();

  @override
  void writeTeamRepository(TeamDbModels teamDbModel) =>
      dataSource.writeTeamDataSource(teamDbModel);

  @override
  void writeUserRepository(UserDBModel userDBModel) =>
      dataSource.writeUserDataSource(userDBModel);

  @override
  List<dynamic> readListOfUserRepository() =>
      dataSource.readListOfUserDataSource();

  @override
  void writeListOfUserRepository(List<UserDBModel> userDbModels) =>
      dataSource.writeListOfUserDataSource(userDbModels);
}

ILocalRepository localRepository = LocalRepository(localDataSource);
