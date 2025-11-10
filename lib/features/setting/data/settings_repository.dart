import 'package:application/features/setting/domain/entities/settings_entity.dart';

abstract class SettingRepository {
  Future<SettingsEntity> getSettings();
  Future<void> updateSettings(SettingsEntity settings);
}