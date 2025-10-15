abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthFailure extends AuthState {
  final String message;
  AuthFailure(this.message);
}

// State OTP
class OtpCountdown extends AuthState {
  final int timeLeft;
  OtpCountdown(this.timeLeft);
}

class OtpVerifying extends AuthState {}

class OtpVerified extends AuthState {}

class OtpInvalid extends AuthState {
  final String message;
  OtpInvalid(this.message);
}

class OtpResent extends AuthState {
  final String message;
  OtpResent(this.message);
}