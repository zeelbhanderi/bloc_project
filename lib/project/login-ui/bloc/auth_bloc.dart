import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>(_onAuthLoginRequest);
    on<AuthLogoutRequested>(_onAuthLogoutRequest);

  }


  void _onAuthLoginRequest(AuthLoginRequested event,Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final email = event.email;
      final password = event.password;
      if (password.length < 6) {
        return emit(
            AuthFailure(error: 'Password must be at least 6 characters'));
      }

      await Future.delayed(const Duration(seconds: 1), () {
        return emit(AuthSuccess(uid: '$email-$password'));
      });
    } catch (e) {
      emit(AuthFailure(error: e.toString()));
    }
  }

  void _onAuthLogoutRequest(AuthLogoutRequested event, emit) {
    emit(AuthLoading());
    try {
      emit(AuthInitial());
    } catch (e) {
      emit(AuthFailure(error: e.toString()));
    }
  }
}
