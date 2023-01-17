import 'package:hive/hive.dart';
import 'package:matter_most_app/data/server/model/responses/login_request.dart';

part 'user_db_model.g.dart';

@HiveType(typeId: 1)
class UserDBModel extends HiveObject {
  @HiveField(1)
  String? id;

  @HiveField(2)
  String? username;

  @HiveField(3)
  String? email;

  @HiveField(4)
  String? nickname;

  @HiveField(5)
  String? firstName;

  @HiveField(6)
  String? lastName;

  @HiveField(7)
  String? position;

  @HiveField(8)
  String? roles;

  @HiveField(9)
  bool? allowMarketing;
}

UserDBModel userDbModelFromRemote(LoginResponse response) {
  UserDBModel userDBModel = UserDBModel();

  userDBModel.id = response.id;
  userDBModel.email = response.email;
  userDBModel.allowMarketing = response.allowMarketing;
  userDBModel.firstName = response.firstName;
  userDBModel.lastName = response.lastName;
  userDBModel.nickname = response.nickname;
  userDBModel.position = response.position;
  userDBModel.roles = response.roles;
  userDBModel.username = response.username;
  return userDBModel;
}

List<UserDBModel> userDbModelListFormRemote(List<LoginResponse> response) {
  return response.map((LoginResponse e) => userDbModelFromRemote(e)).toList();
}
