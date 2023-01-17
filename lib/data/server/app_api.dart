import 'package:dio/dio.dart';
import 'package:matter_most_app/data/server/model/request/app_request.dart';

const String baseUrl = 'http://172.19.0.1:8065/api/v4';

Dio dioWithToken({required String token}) {
  Dio dio = Dio();
  dio.options.headers['Accept'] = 'application/json';
  dio.options.headers['Authorization'] = 'Bearer $token';
  return dio;
}

Future<Response> loginAPI(
        {required String loginId, required String password}) async =>
    await Dio().post('$baseUrl/users/login',
        data: loginRequest(loginId: loginId, password: password));

Future<Response> getTeamUser(
        {required String userId, required String token}) async =>
    await dioWithToken(token: token).get('$baseUrl/users/$userId/teams');

Future<Response> getUsersOfTeam(
        {required String teamId, required String token}) async =>
    await dioWithToken(token: token)
        .get('$baseUrl/users', queryParameters: {'in_team': teamId});

Future<Response> getPostsForChannel(
        {required String token,
        String channelId = 'yxtqfiabu3y6jjdximtbcs1ojc'}) async =>
    await dioWithToken(token: token).get('$baseUrl/channels/$channelId/posts');
