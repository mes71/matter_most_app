import 'package:matter_most_app/data/source/local_datasource.dart';

abstract class ILocalRepository {
  void writeUserDataRepository(
      {required String userName,
      required String password,
      required String token});

  String readTokenRepository();
}

class LocalRepository implements ILocalRepository {
  final ILocalDataSource dataSource;

  LocalRepository(this.dataSource);

  @override
  String readTokenRepository() => dataSource.readTokenDataSource();

  @override
  void writeUserDataRepository(
          {required String userName,
          required String password,
          required String token}) =>
      dataSource.writeUserDataSource(
          userName: userName, password: password, token: token);
}

ILocalRepository localRepository = LocalRepository(localDataSource);
