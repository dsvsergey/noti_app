import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

import '../presentation/screens/home/home_screen.dart';
import '../presentation/screens/login/login_screen.dart';
import 'app_route.dart';

@singleton
class MainRoute {
  late final GoRouter _router;
  GoRouter get route => _router;

  MainRoute() {
    _router = GoRouter(
      routes: [
        GoRoute(
          path: AppRoute.home,
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: AppRoute.login,
          builder: (context, state) => const LoginScreen(),
        ),
      ],
    );
  }
}
