import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  Future<bool> login(String phonenumber, String password) async {
    await Future.delayed(const Duration(seconds: 2));

    if (phonenumber == '0825025347' && password == '1234567a') {
      _isLoggedIn = true;
      notifyListeners();
      return true;
    }

    return false;
  }

  void logout() {
    _isLoggedIn = false;
    notifyListeners();
  }

  String? validatePhoneNumber(String phone) {
    if (phone.isEmpty) return 'Vui lòng nhập số điện thoại';
    if (!RegExp(r'^\d{10}$').hasMatch(phone)) return 'Số điện thoại phải có đúng 10 chữ số';
    return null;
  }

  String? validatePassword(String password) {
    if (password.isEmpty) return 'Vui lòng nhập mật khẩu';
    if (password.length < 8) return 'Mật khẩu phải có ít nhất 8 ký tự';
    if (!RegExp(r'[A-Za-z]').hasMatch(password) || !RegExp(r'\d').hasMatch(password)) {
      return 'Mật khẩu phải có cả chữ và số';
    }
    return null;
  }
}