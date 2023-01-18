import 'package:matter_most_app/data/server/model/responses/User_teams.dart';
import 'package:matter_most_app/data/server/model/responses/login_request.dart';
import 'package:matter_most_app/data/server/model/responses/post/create_post_response.dart';
import 'package:matter_most_app/data/server/model/responses/post/get_all_posts_response.dart';
import 'package:matter_most_app/data/source/remote_datasource.dart';

abstract class IRemoteRepository {
  Future<LoginResponse> loginRepository(
      {required String loginId, required String password});

  Future<UserTeams> getUserTeamRepository(
      {required String userId, required String token});

  Future<List<LoginResponse>> getUsersOfTeamsRepository(
      {required String teamId, required String token});

  Future<GetAllPostsResponse> getAllPostsChannelsRepository(
      {required String token});

  Future<CreatePostResponse> createPostRepository(
      {required String token, required Map<String, dynamic> message});
}

class RemoteRepository implements IRemoteRepository {
  final IRemoteDatasource remoteDatasource;

  RemoteRepository(this.remoteDatasource);

  @override
  Future<LoginResponse> loginRepository(
          {required String loginId, required String password}) async =>
      await remoteDatasource.loginDatasource(
          loginId: loginId, password: password);

  @override
  Future<UserTeams> getUserTeamRepository(
          {required String userId, required String token}) async =>
      await remoteDatasource.getUserTeamDataSource(
          userId: userId, token: token);

  @override
  Future<List<LoginResponse>> getUsersOfTeamsRepository(
          {required String teamId, required String token}) async =>
      await remoteDatasource.getUsersOfTeamsDataSource(
          teamId: teamId, token: token);

  @override
  Future<GetAllPostsResponse> getAllPostsChannelsRepository(
          {required String token}) async =>
      await remoteDatasource.getAllPostsChannelDataSource(token: token);

  @override
  Future<CreatePostResponse> createPostRepository(
          {required String token,
          required Map<String, dynamic> message}) async =>
      await remoteDatasource.createPostDataSource(
          token: token, message: message);



}

IRemoteRepository remoteRepository = RemoteRepository(remoteDatasource);
