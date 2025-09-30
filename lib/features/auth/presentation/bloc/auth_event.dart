abstract class AuthEvent {}

class LoginSubmitted extends AuthEvent {
  final String phone;
  final String password;
  LoginSubmitted(this.phone, this.password);
}