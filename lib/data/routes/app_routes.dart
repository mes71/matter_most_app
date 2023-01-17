import 'package:go_router/go_router.dart';
import 'package:matter_most_app/ui/auth/auth_screen.dart';
import 'package:matter_most_app/ui/chat/chat_screen.dart';
import 'package:matter_most_app/ui/home/home_screen.dart';

const String HOME_ROUTE = "/homeRoute";
const String CHAT_ROUTE = "/chatRoute";

GoRouter app_router = GoRouter(routes: [
  GoRoute(
    path: "/",
    builder: (context, state) => const AuthScreen(),
  ),
  GoRoute(
    path: HOME_ROUTE,
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: CHAT_ROUTE,
    builder: (context, state) => ChatScreen(),
  )
]);
