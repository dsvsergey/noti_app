part of 'application_cubit.dart';

sealed class ApplicationState extends Equatable {
  const ApplicationState();

  @override
  List<Object> get props => [];
}

final class ApplicationInitial extends ApplicationState {}

final class ApplicationLoading extends ApplicationState {}

final class ApplicationAuthenticated extends ApplicationState {}

final class ApplicationUnauthenticated extends ApplicationState {}

final class ApplicationError extends ApplicationState {
  final String message;

  const ApplicationError(this.message);

  @override
  List<Object> get props => [message];
}
