import 'package:hive/hive.dart';


part 'user_db_model.g.dart';

@HiveType(typeId: 1)
class UserDBModel extends HiveObject {
  @HiveField(1)
  String? token;

  @HiveField(2)
  String? userName;

  @HiveField(3)
  String? password;
}
