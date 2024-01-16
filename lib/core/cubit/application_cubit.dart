import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'application_state.dart';

@singleton
class ApplicationCubit extends Cubit<ApplicationState> {
  ApplicationCubit() : super(ApplicationInitial());

  Future<void> signIn() {
    emit(ApplicationLoading());
    return Future.value();
  }

  Future<void> signOut() {
    emit(ApplicationLoading());
    return Future.value();
  }
}
