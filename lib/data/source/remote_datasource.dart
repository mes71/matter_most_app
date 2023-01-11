import 'package:matter_most_app/data/server/app_api.dart';
import 'package:matter_most_app/data/server/model/request/login_request.dart';

abstract class IRemoteDatasource {
  Future<LoginRequest> loginDatasource(
      {required String loginId, required String password});
}

class RemoteDataSource implements IRemoteDatasource {
  @override
  Future<LoginRequest> loginDatasource(
      {required String loginId, required String password}) async {
    var res = await loginAPI(loginId: loginId, password: password);

    return LoginRequest.fromJson(res.data,
        token: res.headers.map['token']!.first);
  }
}

IRemoteDatasource remoteDatasource = RemoteDataSource();
