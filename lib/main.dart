import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:matter_most_app/data/db/model/user/user_db_model.dart';
import 'package:matter_most_app/data/db/model/user/user_team/team_db_models.dart';
import 'package:matter_most_app/data/db/utils.dart';
import 'package:matter_most_app/data/routes/app_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(UserDBModelAdapter());
  Hive.registerAdapter(TeamDbModelsAdapter());

  //for open all boxes
  for (String item in boxNames) {
    await Hive.openBox(item);
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: app_router,
      title: 'MatterMost',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
    );
  }
}
