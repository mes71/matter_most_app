import 'package:dio/dio.dart';
import 'package:matter_most_app/data/server/model/responses/User_teams.dart';
import 'package:matter_most_app/data/server/model/responses/login_request.dart';
import 'package:matter_most_app/data/server/model/responses/post/get_all_posts_response.dart';
import 'package:matter_most_app/data/server/model/responses/post/post_response.dart';
import 'package:matter_most_app/data/server/model/responses/upload_model_response.dart';
import 'package:matter_most_app/data/source/remote_datasource.dart';

abstract class IRemoteRepository {
  Future<UserResponse> loginRepository(
      {required String loginId, required String password});

  Future<UserTeams> getUserTeamRepository(
      {required String userId, required String token});

  Future<List<UserResponse>> getUsersOfTeamsRepository(
      {required String teamId, required String token});

  Future<GetAllPostsResponse> getAllPostsChannelsRepository(
      {required String token});

  Future<PostResponse> createPostRepository(
      {required String token, required Map<String, dynamic> message});

  Future<List<UserResponse>> getAllUsersRepository({required String token});

  Future<Response> deletePostRepository(
      {required String token, required String postId});

  Future<UploadModelResponse> createUploadFileRepository(
      {required String token, required Map uploadData});
}

class RemoteRepository implements IRemoteRepository {
  final IRemoteDatasource remoteDatasource;

  RemoteRepository(this.remoteDatasource);

  @override
  Future<UserResponse> loginRepository(
      {required String loginId, required String password}) async =>
      await remoteDatasource.loginDatasource(
          loginId: loginId, password: password);

  @override
  Future<UserTeams> getUserTeamRepository(
      {required String userId, required String token}) async =>
      await remoteDatasource.getUserTeamDataSource(
          userId: userId, token: token);

  @override
  Future<List<UserResponse>> getUsersOfTeamsRepository(
      {required String teamId, required String token}) async =>
      await remoteDatasource.getUsersOfTeamsDataSource(
          teamId: teamId, token: token);

  @override
  Future<GetAllPostsResponse> getAllPostsChannelsRepository(
      {required String token}) async =>
      await remoteDatasource.getAllPostsChannelDataSource(token: token);

  @override
  Future<PostResponse> createPostRepository({required String token,
    required Map<String, dynamic> message}) async =>
      await remoteDatasource.createPostDataSource(
          token: token, message: message);

  @override
  Future<List<UserResponse>> getAllUsersRepository(
      {required String token}) async =>
      await remoteDatasource.getAllUsersDataSource(token: token);

  @override
  Future<Response> deletePostRepository(
      {required String token, required String postId}) async =>
      remoteDatasource.deletePostDataSource(token: token, postId: postId);

  @override
  Future<UploadModelResponse> createUploadFileRepository(
      {required String token, required Map uploadData}) async =>
      remoteDatasource.createUploadFileDataSource(
          token: token, uploadData: uploadData);

}

  IRemoteRepository remoteRepository = RemoteRepository(remoteDatasource);
