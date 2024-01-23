import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../presentation/screens/history/history_screen.dart';
import '../presentation/screens/home/home_screen.dart';
import '../presentation/screens/login/login_screen.dart';
import '../presentation/screens/select_trigger/select_trigger_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginRoute.page, initial: true),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: HistoryRoute.page),
        AutoRoute(page: SelectTriggerRoute.page),
      ];
}
