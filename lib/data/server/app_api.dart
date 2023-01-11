import 'package:dio/dio.dart';
import 'package:matter_most_app/data/server/model/response/app_response.dart';

const String baseUrl = 'http://172.19.32.1:8065/api/v4';

Future<Response> loginAPI(
        {required String loginId, required String password}) async =>
    await Dio().post('$baseUrl/users/login',
        data: loginResponse(loginId: loginId, password: password));
