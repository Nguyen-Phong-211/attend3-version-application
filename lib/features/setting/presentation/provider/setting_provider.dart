import 'package:flutter/material.dart';
import 'package:application/features/setting/domain/usecases/get_settings_usecase.dart';
import 'package:application/features/setting/domain/usecases/update_settings_usecase.dart';
import 'package:application/features/setting/domain/entities/settings_entity.dart';

class SettingProvider extends ChangeNotifier {
  final GetSettingsUseCase getSettingsUseCase;
  final UpdateSettingsUseCase updateSettingsUseCase;

  SettingProvider({
    required this.getSettingsUseCase,
    required this.updateSettingsUseCase,
  });

  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;

  bool _pushNotifications = true;
  bool get pushNotifications => _pushNotifications;

  String _language = 'vi';
  String get language => _language;

  bool get isVietnamese => _language == 'vi';

  Map<String, String> userInfo = const {'name': 'Lê Văn Phong', 'email': 'phong.le@example.com'};
  bool isLoading = true;

  Future<void> loadSettings() async {
    isLoading = true;
    notifyListeners();

    try {
      final settings = await getSettingsUseCase();
      _isDarkMode = settings.isDarkMode;
      _pushNotifications = settings.pushNotifications;
      _language = settings.language;
    } catch (e) {
      debugPrint('Failed to load settings: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> toggleDarkMode(bool value) async {
    _isDarkMode = value;
    notifyListeners();

    try {
      await updateSettingsUseCase(SettingsEntity(
        isDarkMode: _isDarkMode,
        pushNotifications: _pushNotifications,
        language: _language,
      ));
    } catch (e) {
      debugPrint('Failed to update dark mode: $e');
    }
  }

  Future<void> togglePushNotifications(bool value) async {
    _pushNotifications = value;
    notifyListeners();

    try {
      await updateSettingsUseCase(SettingsEntity(
        isDarkMode: _isDarkMode,
        pushNotifications: _pushNotifications,
        language: _language,
      ));
    } catch (e) {
      debugPrint('Failed to update push notifications: $e');
    }
  }

  Future<void> changeLanguage(String code) async {
    _language = code;
    notifyListeners();

    try {
      await updateSettingsUseCase(SettingsEntity(
        isDarkMode: _isDarkMode,
        pushNotifications: _pushNotifications,
        language: _language,
      ));
    } catch (e) {
      debugPrint('Failed to update language: $e');
    }
  }
}