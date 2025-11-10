import 'package:application/features/setting/domain/entities/settings_entity.dart';
import 'package:application/features/setting/data_sources/setting_remote_data_source.dart';
import 'settings_repository.dart';

class SettingsRepositoryImpl implements SettingRepository {
  final SettingRemoteDataSource remoteDataSource;

  SettingsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<SettingsEntity> getSettings() {
    return remoteDataSource.getSettings();
  }

  @override
  Future<void> updateSettings(SettingsEntity settings) {
    return remoteDataSource.updateSettings(settings);
  }
}