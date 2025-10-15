import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:application/features/auth/data/auth_repository.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import 'package:application/core/constants/app_label.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;

  Timer? _timer;
  int _timeLeft = 300;

  AuthBloc(this.repository) : super(AuthInitial()) {
    // Processing login
    on<LoginSubmitted>((event, emit) async {
      emit(AuthLoading());
      final success = await repository.login(event.phone, event.password);
      if (success) {
        emit(AuthSuccess());
      } else {
        emit(AuthFailure(AppLabel.informErrorLogin));
      }
    });

    // Processing OTP
    on<OtpStarted>(_onOtpStarted);
    on<OtpTicked>(_onOtpTicked);
    on<OtpResendRequested>(_onOtpResendRequested);
    on<OtpSubmitted>(_onOtpSubmitted);
  }

  void _onOtpStarted(OtpStarted event, Emitter<AuthState> emit) {
    _timeLeft = 300;
    _timer?.cancel();
    emit(OtpCountdown(_timeLeft));
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeLeft == 0) {
        timer.cancel();
      } else {
        _timeLeft--;
        add(OtpTicked());
      }
    });
  }

  void _onOtpTicked(OtpTicked event, Emitter<AuthState> emit) {
    emit(OtpCountdown(_timeLeft));
  }

  void _onOtpResendRequested(OtpResendRequested event, Emitter<AuthState> emit) {
    // gọi API resend OTP
    _timeLeft = 300;
    emit(OtpCountdown(_timeLeft));
    emit(OtpResent(AppLabel.informInformResendOTP));
    add(OtpStarted());
  }

  Future<void> _onOtpSubmitted(OtpSubmitted event, Emitter<AuthState> emit) async {
    emit(OtpVerifying());
    final success = await repository.verifyOtp(event.otp);

    if (success) {
      emit(OtpVerified());
    } else {
      emit(OtpInvalid(AppLabel.informErrorSubmitOTP));
    }
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}