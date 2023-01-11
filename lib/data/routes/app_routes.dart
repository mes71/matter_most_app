import 'package:go_router/go_router.dart';
import 'package:matter_most_app/ui/auth/auth_screen.dart';
import 'package:matter_most_app/ui/home/home_screen.dart';

const String HOME_ROUTE = "/homeRoute";

GoRouter app_router = GoRouter(routes: [
  GoRoute(
    path: "/",
    builder: (context, state) => const AuthScreen(),
  ),
  GoRoute(
    path: HOME_ROUTE,
    builder: (context, state) => const HomeScreen(),
  ),
]);
