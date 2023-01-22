import 'dart:convert';

const String AUTH_ACTION_SOCKET = 'authentication_challenge';
const String USER_TYPING_ACTION_SOCKET = 'user_typing';
const String CHANNEL_ID_DATA_SOCKET = 'channel_id';
const String PARENT_ID_DATA_SOCKET = 'parent_id';
const String TOKEN_DATA_SOCKET = 'token';

String sendSocketEvent(
    {required String action,
    required int seq,
    required Map<String, dynamic> data}) {
  return jsonEncode({"action": action, "seq": seq, "data": data});
}
