import 'package:flutter/material.dart';
import 'package:application/features/auth/presentation/providers/auth_provider.dart';

class AppProvider extends ChangeNotifier {
  AuthProvider? _authProvider;

  // Initialize auth provider
  AuthProvider get authProvider {
    _authProvider ??= AuthProvider();
    return _authProvider!;
  }

  // Reset auth module to avoid memory leaks
  void resetAuthModule() {
    _authProvider?.dispose();
    _authProvider = null;
    notifyListeners();
  }

  // Dispose auth provider
  @override
  void dispose() {
    _authProvider?.dispose();
    super.dispose();
  }
}