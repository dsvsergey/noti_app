// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    HistoryRoute.name: (routeData) {
      final args = routeData.argsAs<HistoryRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HistoryScreen(
          key: args.key,
          minute: args.minute,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HomeScreen(key: args.key),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginScreen(),
      );
    },
    SelectTriggerRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SelectTriggerScreen(),
      );
    },
  };
}

/// generated route for
/// [HistoryScreen]
class HistoryRoute extends PageRouteInfo<HistoryRouteArgs> {
  HistoryRoute({
    Key? key,
    required int minute,
    List<PageRouteInfo>? children,
  }) : super(
          HistoryRoute.name,
          args: HistoryRouteArgs(
            key: key,
            minute: minute,
          ),
          initialChildren: children,
        );

  static const String name = 'HistoryRoute';

  static const PageInfo<HistoryRouteArgs> page =
      PageInfo<HistoryRouteArgs>(name);
}

class HistoryRouteArgs {
  const HistoryRouteArgs({
    this.key,
    required this.minute,
  });

  final Key? key;

  final int minute;

  @override
  String toString() {
    return 'HistoryRouteArgs{key: $key, minute: $minute}';
  }
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<HomeRouteArgs> page = PageInfo<HomeRouteArgs>(name);
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SelectTriggerScreen]
class SelectTriggerRoute extends PageRouteInfo<void> {
  const SelectTriggerRoute({List<PageRouteInfo>? children})
      : super(
          SelectTriggerRoute.name,
          initialChildren: children,
        );

  static const String name = 'SelectTriggerRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
