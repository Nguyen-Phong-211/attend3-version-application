import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthFailure extends AuthState {
  final String message;
  AuthFailure(this.message);

  @override
  List<Object?> get props => [message];
}

// State OTP
class OtpCountdown extends AuthState {
  final int timeLeft;
  OtpCountdown(this.timeLeft);

  @override
  List<Object?> get props => [timeLeft];
}

class OtpVerifying extends AuthState {}

class OtpVerified extends AuthState {}

class OtpInvalid extends AuthState {
  final String message;
  OtpInvalid(this.message);

  @override
  List<Object?> get props => [message];
}

class OtpResent extends AuthState {
  final String message;
  OtpResent(this.message);

  @override
  List<Object?> get props => [message];
}

class LogoutSuccess extends AuthState {}