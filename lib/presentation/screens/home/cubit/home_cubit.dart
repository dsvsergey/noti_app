import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'home_state.dart';

@singleton
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(OneTimeNotificationState());

  void oneTimeNotification() {
    emit(OneTimeNotificationState());
  }

  void recurringNotification() {
    emit(RecurringNotificationState());
  }
}
