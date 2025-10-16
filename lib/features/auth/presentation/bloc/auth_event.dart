import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

// Event login
class LoginSubmitted extends AuthEvent {
  final String phone;
  final String password;

  LoginSubmitted(this.phone, this.password);

  @override
  List<Object?> get props => [phone, password];
}

// Event verify otp
class OtpStarted extends AuthEvent {}

class OtpTicked extends AuthEvent {}

class OtpResendRequested extends AuthEvent {}

class OtpSubmitted extends AuthEvent {
  final String otp;
  OtpSubmitted(this.otp);

  @override
  List<Object?> get props => [otp];
}