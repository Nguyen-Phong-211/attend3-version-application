class SettingsEntity {
  final bool isDarkMode;
  final bool pushNotifications;
  final String language;

  const SettingsEntity({
    required this.isDarkMode,
    required this.pushNotifications,
    required this.language,
  });

  SettingsEntity copyWith({
    bool? isDarkMode,
    bool? pushNotifications,
    String? language,
  }) {
    return SettingsEntity(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      pushNotifications: pushNotifications ?? this.pushNotifications,
      language: language ?? this.language,
    );
  }
}