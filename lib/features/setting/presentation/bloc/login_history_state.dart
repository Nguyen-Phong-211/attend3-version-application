import 'package:application/features/setting/domain/entities/login_history_entity.dart';

abstract class LoginHistoryState {}

class SettingInitial extends LoginHistoryState {}

class SettingLoading extends LoginHistoryState {}

class SettingLoaded extends LoginHistoryState {
  final List<LoginHistoryEntity> history;

  SettingLoaded(this.history);
}

class SettingError extends LoginHistoryState {
  final String message;
  SettingError(this.message);
}