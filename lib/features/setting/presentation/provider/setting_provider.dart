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

  bool isDarkMode = false;
  bool pushNotifications = true;
  Map<String, String> userInfo = const {'name': 'Lê Văn Phong', 'email': 'phong.le@example.com'};
  bool isLoading = true;

  Future<void> loadSettings() async {
    isLoading = true;
    notifyListeners();

    final settings = await getSettingsUseCase();
    isDarkMode = settings.isDarkMode;
    pushNotifications = settings.pushNotifications;

    isLoading = false;
    notifyListeners();
  }

  Future<void> toggleDarkMode(bool value) async {
    isDarkMode = value;
    notifyListeners();

    final entity = SettingsEntity(
      isDarkMode: isDarkMode,
      pushNotifications: pushNotifications,
      language: 'vi',
    );

    await updateSettingsUseCase(entity);
  }

  Future<void> togglePushNotifications(bool value) async {
    pushNotifications = value;
    notifyListeners();

    final entity = SettingsEntity(
      isDarkMode: isDarkMode,
      pushNotifications: pushNotifications,
      language: 'vi',
    );

    await updateSettingsUseCase(entity);
  }
}