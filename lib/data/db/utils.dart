import 'package:matter_most_app/data/db/model/user/user_db_model.dart';
import 'package:matter_most_app/data/db/model/user/user_team/team_db_models.dart';

const String commonBox = 'commonBox';
const String userBox = 'userBox';
const String listUserBox = 'listUsersBox';

//region common box keys
const String userNameCommonBox = 'username';
const String userIDCommonBox = 'userId';
const String teamIDCommonBox = 'teamId';
const String teamNameCommonBox = 'teamName';
const String passwordCommonBox = 'password';
const String tokenCommonBox = 'token';
//endregion

//region user box key
const String authUserBox = 'authUser';
const String teamUserBox = 'teamUser';
//endregion

List<String> boxNames = [commonBox, userBox, listUserBox];

List hiveAdapters = [UserDBModelAdapter(), TeamDbModelsAdapter()];
