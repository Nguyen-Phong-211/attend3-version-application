import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:application/features/setting/domain/usecases/get_settings_usecase.dart';
import 'package:application/features/setting/domain/usecases/update_settings_usecase.dart';
import 'settings_event.dart';
import 'settings_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  final GetSettingsUseCase getSettingsUseCase;
  final UpdateSettingsUseCase updateSettingsUseCase;

  SettingBloc({
    required this.getSettingsUseCase,
    required this.updateSettingsUseCase,
  }) : super(SettingInitial()) {
    on<LoadSettingEvent>(_onLoad);
    on<ToggleDarkModeEvent>(_onToggleDarkMode);
    on<TogglePushNotificationEvent>(_onTogglePushNotification);
  }

  void _onLoad(LoadSettingEvent event, Emitter<SettingState> emit) async {
    try {
      final settings = await getSettingsUseCase();
      emit(SettingLoaded(
        isDarkMode: settings.isDarkMode,
        pushNotifications: settings.pushNotifications,
        userInfo: const {'name': 'Lê Văn Phong', 'email': 'phong.le@example.com'},
      ));
    } catch (e) {
      emit(SettingError(message: 'Không thể tải cài đặt: $e'));
    }
  }

  void _onToggleDarkMode(ToggleDarkModeEvent event, Emitter<SettingState> emit) async {
    if (state is SettingLoaded) {
      final current = state as SettingLoaded;
      final updated = current.copyWith(isDarkMode: event.value);
      emit(updated);
      await updateSettingsUseCase(updated.toEntity());
    }
  }

  void _onTogglePushNotification(
      TogglePushNotificationEvent event, Emitter<SettingState> emit) {
    if (state is SettingLoaded) {
      final current = state as SettingLoaded;
      emit(current.copyWith(pushNotifications: event.value));
      updateSettingsUseCase(
        current.copyWith(pushNotifications: event.value).toEntity(),
      );
    }
  }
}