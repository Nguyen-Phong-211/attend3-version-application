import 'package:application/features/setting/domain/entities/settings_entity.dart';

abstract class SettingState {}

class SettingInitial extends SettingState {}

class SettingLoaded extends SettingState {
  final bool isDarkMode;
  final bool pushNotifications;
  final Map<String, String> userInfo;

  SettingLoaded({
    required this.isDarkMode,
    required this.pushNotifications,
    required this.userInfo,
  });

  SettingLoaded copyWith({
    bool? isDarkMode,
    bool? pushNotifications,
    Map<String, String>? userInfo,
  }) {
    return SettingLoaded(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      pushNotifications: pushNotifications ?? this.pushNotifications,
      userInfo: userInfo ?? this.userInfo,
    );
  }

  // Convert state to entity
  SettingsEntity toEntity() {
    return SettingsEntity(
      isDarkMode: isDarkMode,
      pushNotifications: pushNotifications,
      language: 'vi',
    );
  }
}

class SettingError extends SettingState {
  final String message;
  SettingError({required this.message});
}