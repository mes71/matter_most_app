import 'package:go_router/go_router.dart';
import 'package:matter_most_app/ui/auth/auth_screen.dart';

GoRouter app_router = GoRouter(routes: [
  GoRoute(
    path: "/",
    builder: (context, state) => const AuthScreen(),
  ),
]);
