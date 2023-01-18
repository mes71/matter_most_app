// response for login user
Map<String, dynamic> loginRequest(
    {required String loginId, required String password}) {
  final Map<String, dynamic> map = {};

  map['login_id'] = loginId;
  map['password'] = password;
  return map;
}

Map<String, dynamic> createPostRequest(
    {required String channelId, required String message}) {
  final map = <String, dynamic>{};
  map['channel_id'] = channelId;
  map['message'] = message;
  return map;
}

Map<String, dynamic> authWebSocketResponse({required String token}) {
  final map = <String, dynamic>{};

  map['seq'] = 1;
  map['action'] = 'authentication_challenge';
  map['data'] = {'token': token};

  return map;
}
