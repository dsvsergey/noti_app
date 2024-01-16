part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class OneTimeNotificationState extends HomeState {}

class RecurringNotificationState extends HomeState {}
