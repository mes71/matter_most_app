import 'package:dio/dio.dart';
import 'package:matter_most_app/data/server/model/request/app_request.dart';

const String baseUrl = 'https://mm.atwork.ir/api/v4';
const String baseSocketUrl = 'wss://mm.atwork.ir/api/v4/websocket';

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

Future<Response> getAllUsersOfTeam(
        {required String teamId, required String token}) async =>
    await dioWithToken(token: token)
        .get('$baseUrl/users', queryParameters: {'in_team': teamId});

Future<Response> getAllUsers({required String token}) async =>
    await dioWithToken(token: token).get('$baseUrl/users');

Future<Response> getPostsForChannel(
        {required String token,
        String channelId = '8t5tibt5ktdajx1r9dza4r8gte'}) async =>
    await dioWithToken(token: token).get('$baseUrl/channels/$channelId/posts');

Future<Response> createPost(
        {required String token,
        required Map<String, dynamic> message,
        String channelId = '8t5tibt5ktdajx1r9dza4r8gte'}) async =>
    await dioWithToken(token: token)
        .post('$baseUrl/posts?set_online=true', data: message);
