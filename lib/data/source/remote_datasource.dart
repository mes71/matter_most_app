import 'package:dio/dio.dart';
import 'package:matter_most_app/data/server/app_api.dart';
import 'package:matter_most_app/data/server/model/responses/User_teams.dart';
import 'package:matter_most_app/data/server/model/responses/login_request.dart';
import 'package:matter_most_app/data/server/model/responses/post/get_all_posts_response.dart';
import 'package:matter_most_app/data/server/model/responses/post/post_response.dart';
import 'package:matter_most_app/data/server/model/responses/upload_model_response.dart';
import 'package:matter_most_app/data/server/utils/http_validator.dart';

abstract class IRemoteDatasource {
  Future<UserResponse> loginDatasource(
      {required String loginId, required String password});

  Future<UserTeams> getUserTeamDataSource(
      {required String userId, required String token});

  Future<List<UserResponse>> getAllUsersDataSource({required String token});

  Future<List<UserResponse>> getUsersOfTeamsDataSource(
      {required String teamId, required String token});

  Future<GetAllPostsResponse> getAllPostsChannelDataSource(
      {required String token});

  Future<PostResponse> createPostDataSource(
      {required String token, required Map<String, dynamic> message});

  Future<Response> deletePostDataSource(
      {required String token, required String postId});

  Future<UploadModelResponse> createUploadFileDataSource(
      {required String token, required Map uploadData});
}

class RemoteDataSource with HttpValidator implements IRemoteDatasource {
  @override
  Future<UserResponse> loginDatasource(
      {required String loginId, required String password}) async {
    var res = await loginAPI(loginId: loginId, password: password);
    validateResponse(res);
    return UserResponse.fromJson(res.data,
        token: res.headers.map['token']!.first);
  }

  @override
  Future<UserTeams> getUserTeamDataSource(
      {required String userId, required String token}) async {
    var res = await getTeamUser(userId: userId, token: token);
    validateResponse(res);
    return UserTeams.fromJson((res.data as List<dynamic>).first);
  }

  @override
  Future<List<UserResponse>> getUsersOfTeamsDataSource(
      {required String teamId, required String token}) async {
    List<UserResponse> userList = [];
    var res = await getAllUsersOfTeam(teamId: teamId, token: token);
    validateResponse(res);
    for (var item in res.data) {
      userList.add(UserResponse.fromJson(item, token: ''));
    }
    return userList;
  }

  @override
  Future<GetAllPostsResponse> getAllPostsChannelDataSource(
      {required String token}) async {
    var res = await getPostsForChannel(token: token);
    validateResponse(res);
    return GetAllPostsResponse.fromJson(res.data);
  }

  @override
  Future<PostResponse> createPostDataSource(
      {required String token, required Map<String, dynamic> message}) async {
    var res = await createPost(token: token, message: message);
    validateResponse(res);
    return PostResponse.fromJson(res.data);
  }

  @override
  Future<List<UserResponse>> getAllUsersDataSource(
      {required String token}) async {
    List<UserResponse> result = [];
    var res = await getAllUsers(token: token);
    validateResponse(res);
    for (var item in res.data) {
      result.add(UserResponse.fromJson(item, token: ''));
    }
    return result;
  }

  @override
  Future<Response> deletePostDataSource(
      {required String token, required String postId}) async {
    var res = await deletePost(token: token, postId: postId);
    validateResponse(res);
    return res;
  }

  @override
  Future<UploadModelResponse> createUploadFileDataSource(
      {required String token, required Map uploadData}) async {
    Response res = await uploadFile(token: token, uploadData: uploadData);
    validateResponse(res);
    UploadModelResponse uploadModelResponse =
        UploadModelResponse.fromJson(res.data);

    return uploadModelResponse;
  }
}

IRemoteDatasource remoteDatasource = RemoteDataSource();
