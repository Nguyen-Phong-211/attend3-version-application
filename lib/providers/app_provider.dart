import 'package:flutter/material.dart';

/// Global provider to hold app-level states
/// such as theme, locale, user session, etc.
/// This is independent of feature-specific blocs.
class AppProvider extends ChangeNotifier {
  // -----------------------------
  // Theme management
  // -----------------------------
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  // -----------------------------
  // Locale / Language settings
  // -----------------------------
  Locale _locale = const Locale('vi', 'VN');
  Locale get locale => _locale;

  void setLocale(Locale locale) {
    _locale = locale;
    notifyListeners();
  }

  // -----------------------------
  // Global user session
  // -----------------------------
  String? _userName;
  String? _accessToken;

  String? get userName => _userName;
  String? get accessToken => _accessToken;

  void updateUser({required String name, required String token}) {
    _userName = name;
    _accessToken = token;
    notifyListeners();
  }

  void clearSession() {
    _userName = null;
    _accessToken = null;
    notifyListeners();
  }

// -----------------------------
// Future integration
// -----------------------------
// TODO: Replace mock data when connecting real APIs
// Example:
// Future<void> loadUserProfile() async {
//   final profile = await userRepository.getProfile();
//   _userName = profile.name;
//   notifyListeners();
// }

// You can also persist data locally using SharedPreferences or Hive.
}
