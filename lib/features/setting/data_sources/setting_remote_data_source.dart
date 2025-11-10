import 'package:shared_preferences/shared_preferences.dart';
import 'package:application/features/setting/domain/entities/settings_entity.dart';

abstract class SettingRemoteDataSource {
  Future<SettingsEntity> getSettings();
  Future<void> updateSettings(SettingsEntity settings);
}

class SettingRemoteDataSourceImpl implements SettingRemoteDataSource {
  @override
  Future<SettingsEntity> getSettings() async {
    final prefs = await SharedPreferences.getInstance();
    return SettingsEntity(
      isDarkMode: prefs.getBool('dark_mode') ?? false,
      pushNotifications: prefs.getBool('push_notifications') ?? true,
      language: prefs.getString('language') ?? 'vi',
    );
  }

  @override
  Future<void> updateSettings(SettingsEntity settings) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('dark_mode', settings.isDarkMode);
    await prefs.setBool('push_notifications', settings.pushNotifications);
    await prefs.setString('language', settings.language);
  }
}