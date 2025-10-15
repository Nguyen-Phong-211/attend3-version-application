import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository  {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  Future<bool> login(String phonenumber, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    if (phonenumber == '0825025347' && password == '1234567a') {
      _isLoggedIn = true;
      return true;
    }
    return false;
  }

  // @override must implement on interface
  @override
  Future<void> resendOtp(String phone) async {
    // Call API to response OTP
    //
    await Future.delayed(const Duration(seconds: 1));
  }

  void logout() {
    _isLoggedIn = false;
  }

  // Process input otp to verify
  Future<bool> verifyOtp(String otp) async {
    if (otp.length == 6 && RegExp(r'^\d{6}$').hasMatch(otp)) {
      // then call api to process
      // final response = await AuthApi.verifyOtp(otp);
      // return response.success;
      return true;
    }
    return false;
  }
}