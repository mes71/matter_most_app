import 'package:flutter/material.dart';
import 'package:matter_most_app/data/routes/app_routes.dart';

void main() {
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
