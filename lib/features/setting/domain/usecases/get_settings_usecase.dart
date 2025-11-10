import 'package:application/features/setting/domain/entities/settings_entity.dart';
import 'package:application/features/setting/data/settings_repository.dart';

class GetSettingsUseCase {
  final SettingRepository repository;

  GetSettingsUseCase(this.repository);

  Future<SettingsEntity> call() {
    return repository.getSettings();
  }
}