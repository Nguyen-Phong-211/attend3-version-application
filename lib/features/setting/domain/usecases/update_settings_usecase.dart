import 'package:application/features/setting/domain/entities/settings_entity.dart';
import 'package:application/features/setting/data/settings_repository.dart';

class UpdateSettingsUseCase {
  final SettingRepository repository;

  UpdateSettingsUseCase(this.repository);

  Future<void> call(SettingsEntity settings) {
    return repository.updateSettings(settings);
  }
}
