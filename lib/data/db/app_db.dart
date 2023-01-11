import 'package:hive_flutter/hive_flutter.dart';
import 'package:matter_most_app/data/db/utils.dart';

void writeUserData(
    {required String userName,
    required String password,
    required String token}) {
  var box = Hive.box(userBox);

  box.put(userNameUserBox, userName);
  box.put(passwordUserBox, password);
  box.put(tokenUserBox, token);
}

String readToken() {
  var box = Hive.box(userBox);
  return box.get(tokenUserBox);
}
