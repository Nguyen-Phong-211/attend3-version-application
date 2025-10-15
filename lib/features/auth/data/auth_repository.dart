abstract class AuthRepository {
  Future<bool> login(String phone, String password);
  Future<bool> verifyOtp(String otp);
  Future<void> resendOtp(String phone);
}