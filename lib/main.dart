import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'core/application.dart';
import 'main.config.dart';

@InjectableInit()
void _configureDependencies() => GetIt.I.init();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _configureDependencies();

  final talker = TalkerFlutter.init();
  GetIt.I.registerSingleton(talker);
  GetIt.I<Talker>().debug('Talker started...');

  Bloc.observer = TalkerBlocObserver(
    talker: talker,
    settings: const TalkerBlocLoggerSettings(
      printStateFullData: false,
      printEventFullData: false,
    ),
  );

  runZonedGuarded(() => runApp(const Application()), (error, stack) {
    GetIt.I<Talker>().error(error, stack);
  });
}
