abstract class AuthEvent {}

// Event login
class LoginSubmitted extends AuthEvent {
  final String phone;
  final String password;
  LoginSubmitted(this.phone, this.password);
}

// Event verify otp
class OtpStarted extends AuthEvent {}

class OtpTicked extends AuthEvent {}

class OtpResendRequested extends AuthEvent {}

class OtpSubmitted extends AuthEvent {
  final String otp;
  OtpSubmitted(this.otp);
}