abstract class SettingEvent {}

class LoadSettingEvent extends SettingEvent {}

class ToggleDarkModeEvent extends SettingEvent {
  final bool value;
  ToggleDarkModeEvent(this.value);
}

class TogglePushNotificationEvent extends SettingEvent {
  final bool value;
  TogglePushNotificationEvent(this.value);
}