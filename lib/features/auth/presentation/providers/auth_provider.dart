import 'package:flutter/material.dart';
import 'login_provider.dart';

class AuthProvider extends ChangeNotifier {
  late final LoginProvider loginProvider;

  bool _isLoggedIn = false;
  bool _loading = false;

  bool get isLoggedIn => _isLoggedIn;
  bool get loading => _loading;

  AuthProvider() {
    loginProvider = LoginProvider();
  }

  void notifyAuthUpdate() {
    notifyListeners();
  }

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void setLoggedIn(bool value) {
    _isLoggedIn = value;
    notifyListeners();
  }
}