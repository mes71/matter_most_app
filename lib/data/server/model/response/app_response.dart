// response for login user
Map<String, dynamic> loginResponse(
    {required String loginId, required String password}) {
  final Map<String, dynamic> map = {};

  map['login_id'] = loginId;
  map['password'] = password;
  return map;
}
