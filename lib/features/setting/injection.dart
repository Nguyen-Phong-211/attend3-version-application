import 'package:application/features/setting/presentation/provider/login_history_provider.dart';
import 'package:get_it/get_it.dart';

// --- Settings Feature ---
import 'package:application/features/setting/data_sources/setting_remote_data_source.dart';
import 'package:application/features/setting/data/settings_repository_impl.dart';
import 'package:application/features/setting/domain/usecases/get_settings_usecase.dart';
import 'package:application/features/setting/domain/usecases/update_settings_usecase.dart';
import 'package:application/features/setting/presentation/bloc/settings_bloc.dart';

// --- Login History Feature ---
import 'package:application/features/setting/data_sources/login_history_remote_data_source.dart';
import 'package:application/features/setting/data/login_history_repository_impl.dart';
import 'package:application/features/setting/domain/repositories/login_history_repository.dart';
import 'package:application/features/setting/domain/usecases/get_login_history_usecase.dart';
import 'package:application/features/setting/presentation/bloc/login_history_bloc.dart';

import 'data/settings_repository.dart';

final sl = GetIt.instance;

/// * SETTINGS MODULE * ///
void initSettingModule() {
  // Data source
  sl.registerLazySingleton<SettingRemoteDataSource>(
        () => SettingRemoteDataSourceImpl(),
  );

  // Repository
  sl.registerLazySingleton<SettingRepository>(
        () => SettingsRepositoryImpl(remoteDataSource: sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => GetSettingsUseCase(sl()));
  sl.registerLazySingleton(() => UpdateSettingsUseCase(sl()));

  // Bloc
  sl.registerFactory(
        () => SettingBloc(
      getSettingsUseCase: sl(),
      updateSettingsUseCase: sl(),
    ),
  );
}

/// * LOGIN HISTORY MODULE * ///
void initLoginHistoryModule() {
  // Data source
  sl.registerLazySingleton<LoginHistoryRemoteDataSource>(
        () => LoginHistoryRemoteDataSourceImpl(baseUrl: 'https://api.example.com'),
  );

  // Repository
  sl.registerLazySingleton<LoginHistoryRepository>(
        () => LoginHistoryRepositoryImpl(remoteDataSource: sl()),
  );

  // Use case
  sl.registerLazySingleton(
        () => GetLoginHistoryUseCase(repository: sl()),
  );

  // Bloc
  sl.registerFactory(
        () => LoginHistoryBloc(getLoginHistoryUseCase: sl()),
  );

  // Provider
  sl.registerLazySingleton(
        () => LoginHistoryProvider(getLoginHistoryUseCase: sl()),
  );
}