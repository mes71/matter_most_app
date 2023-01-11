import 'package:matter_most_app/data/db/app_db.dart';

abstract class ILocalDataSource {
  void writeUserDataSource(
      {required String userName,
      required String password,
      required String token});

  String readTokenDataSource();
}

class LocalDataSource implements ILocalDataSource {
  @override
  String readTokenDataSource() => readToken();

  @override
  void writeUserDataSource(
          {required String userName,
          required String password,
          required String token}) =>
      writeUserData(userName: userName, password: password, token: token);
}

ILocalDataSource localDataSource = LocalDataSource();
