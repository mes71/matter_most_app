import 'package:matter_most_app/data/server/app_api.dart';
import 'package:matter_most_app/data/server/model/responses/User_teams.dart';
import 'package:matter_most_app/data/server/model/responses/login_request.dart';
import 'package:matter_most_app/data/server/model/responses/post/get_all_posts_response.dart';

abstract class IRemoteDatasource {
  Future<LoginResponse> loginDatasource(
      {required String loginId, required String password});

  Future<UserTeams> getUserTeamDataSource(
      {required String userId, required String token});

  Future<List<LoginResponse>> getUsersOfTeamsDataSource(
      {required String teamId, required String token});

  Future<GetAllPostsResponse> getAllPostsChannelDataSource(
      {required String token});
}

class RemoteDataSource implements IRemoteDatasource {
  @override
  Future<LoginResponse> loginDatasource(
      {required String loginId, required String password}) async {
    var res = await loginAPI(loginId: loginId, password: password);

    return LoginResponse.fromJson(res.data,
        token: res.headers.map['token']!.first);
  }

  @override
  Future<UserTeams> getUserTeamDataSource(
      {required String userId, required String token}) async {
    var res = await getTeamUser(userId: userId, token: token);

    return UserTeams.fromJson((res.data as List<dynamic>).first);
  }

  @override
  Future<List<LoginResponse>> getUsersOfTeamsDataSource(
      {required String teamId, required String token}) async {
    List<LoginResponse> userList = [];
    var res = await getUsersOfTeam(teamId: teamId, token: token);
    for (var item in res.data) {
      userList.add(LoginResponse.fromJson(item, token: ''));
    }
    return userList;
  }

  @override
  Future<GetAllPostsResponse> getAllPostsChannelDataSource(
      {required String token}) async {
    var res = await getPostsForChannel(token: token);
    return GetAllPostsResponse.fromJson(res.data);
  }
}

IRemoteDatasource remoteDatasource = RemoteDataSource();
