import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:application/features/auth/data/auth_repository.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;

  AuthBloc(this.repository) : super(AuthInitial()) {
    on<LoginSubmitted>((event, emit) async {
      emit(AuthLoading());
      final success = await repository.login(event.phone, event.password);
      if (success) {
        emit(AuthSuccess());
      } else {
        emit(AuthFailure('Số điện thoại hoặc mật khẩu không đúng'));
      }
    });
  }
}