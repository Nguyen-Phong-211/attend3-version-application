import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  String? _email;
  String? _password;
  bool _loading = false;

  String? get email => _email;
  String? get password => _password;
  bool get loading => _loading;

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }
}