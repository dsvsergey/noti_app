import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'app_route.dart';
import 'cubit/application_cubit.dart';
import 'main_route.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => GetIt.I<MainRoute>(),
      child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => GetIt.I<ApplicationCubit>()),
          ],
          child: BlocBuilder<ApplicationCubit, ApplicationState>(
            builder: (context, state) {
              return MaterialApp.router(
                routeInformationProvider:
                    GetIt.I<MainRoute>().route.routeInformationProvider,
                routeInformationParser:
                    GetIt.I<MainRoute>().route.routeInformationParser,
                routerDelegate: GetIt.I<MainRoute>().route.routerDelegate,
                title: 'Noti App',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                ),
                debugShowCheckedModeBanner: false,
              );
            },
          )),
    );
  }
}

@module
abstract class ApplicationModule {
  @singleton
  AppRoute appRoute() => AppRoute();
}
