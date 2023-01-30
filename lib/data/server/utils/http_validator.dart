import 'package:dio/dio.dart';

mixin HttpValidator {
  validateResponse(Response response) {
    if (response.statusCode == 501) {
      throw Exception('Feature is disabled');
    } else if (response.statusCode == 413) {
      throw Exception('Content too large');
    } else if (response.statusCode == 413) {
      throw Exception('Do not have appropriate permissions');
    } else if (response.statusCode == 401) {
      throw Exception('No access token provided');
    } else if (response.statusCode == 400) {
      throw Exception('Invalid or missing parameters in URL or request body');
    }
  }
}
