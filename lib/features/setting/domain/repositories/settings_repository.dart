import 'package:application/features/setting/domain/entities/settings_entity.dart';
import 'package:application/features/setting/domain/entities/login_history_entity.dart';

abstract class SettingsRepository {
  // SETTING
  Future<SettingsEntity> getSettings();
  Future<void> updateSettings(SettingsEntity settings);

  // LOGIN HISTORY
  Future<List<LoginHistoryEntity>> getLoginHistory();
}