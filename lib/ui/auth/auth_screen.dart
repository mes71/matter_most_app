import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matter_most_app/data/db/model/user/user_db_model.dart';
import 'package:matter_most_app/data/db/model/user/user_team/team_db_models.dart';
import 'package:matter_most_app/data/repository/local_repository.dart';
import 'package:matter_most_app/data/repository/remote_repsitory.dart';
import 'package:matter_most_app/data/routes/app_routes.dart';
import 'package:matter_most_app/data/server/model/responses/User_teams.dart';
import 'package:matter_most_app/data/server/model/responses/login_request.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _usernameController =
      TextEditingController(text: 'mr.mojtaba');
  final TextEditingController _passwordController =
      TextEditingController(text: '12345678');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: AlignmentDirectional.center,
        padding: EdgeInsets.symmetric(horizontal: 16),
        color: Colors.lightGreen.shade200,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 15),
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'username',
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'password'),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () async {
                      LoginResponse res =
                          await remoteRepository.loginRepository(
                              loginId: _usernameController.text,
                              password: _passwordController.text);

                      UserTeams userTeam =
                          await remoteRepository.getUserTeamRepository(
                              userId: res.id!, token: res.token!);

                      List<LoginResponse> listOfUser =
                          await remoteRepository.getUsersOfTeamsRepository(
                              teamId: userTeam.id!, token: res.token!);
                      log(listOfUser.length.toString());

                      localRepository.writeCommonDataRepository(
                          userName: _usernameController.text,
                          password: _passwordController.text,
                          userID: res.id!,
                          teamId: userTeam.id!,
                          teamName: userTeam.name!,
                          token: res.token!);

                      localRepository.writeListOfUserRepository(
                          userDbModelListFormRemote(listOfUser));

                      log(localRepository
                          .readListOfUserRepository()
                          .length
                          .toString());

                      localRepository.writeTeamRepository(
                          teamDbModelsFromRemote(userTeam));

                      localRepository
                          .writeUserRepository(userDbModelFromRemote(res));
                      goHome();
                    },
                    child: Text('Login'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void goHome() {
    context.go(HOME_ROUTE);
  }
}
