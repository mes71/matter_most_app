import 'package:matter_most_app/data/server/model/request/login_request.dart';
import 'package:matter_most_app/data/source/remote_datasource.dart';

abstract class IRemoteRepository {
  Future<LoginRequest> loginRepository(
      {required String loginId, required String password});
}

class RemoteRepository implements IRemoteRepository {
  final IRemoteDatasource remoteDatasource;

  RemoteRepository(this.remoteDatasource);

  @override
  Future<LoginRequest> loginRepository(
          {required String loginId, required String password}) async =>
      await remoteDatasource.loginDatasource(
          loginId: loginId, password: password);
}

IRemoteRepository remoteRepository = RemoteRepository(remoteDatasource);
