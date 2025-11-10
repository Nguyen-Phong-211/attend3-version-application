import 'package:application/features/schedule/presentation/bloc/schedule_teaching_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:application/features/schedule/data_sources/schedule_remote_data_sources.dart';
import 'package:application/features/schedule/data_sources/schedule_mock_data_source.dart';
import 'package:application/features/schedule/data/schedule_repository_impl.dart';
import 'package:application/features/schedule/data/schedule_repository.dart';
import 'package:application/features/schedule/domain/usecases/get_schedule_usecase.dart';
import 'package:application/features/schedule/presentation/bloc/schedule_bloc.dart';

import 'package:application/features/schedule/data/schdule_teaching_repository_impl.dart';
import 'package:application/features/schedule/data_sources/schedule_teaching_remote_data_source.dart';
import 'package:application/features/schedule/domain/usecases/get_schedule_teaching_usecase.dart';
import 'package:application/features/schedule/data/schedule_teaching_repository.dart';

final sl = GetIt.instance;

void initScheduleModule() {
  // Dio
  if (!sl.isRegistered<Dio>()) {
    sl.registerLazySingleton<Dio>(() => Dio());
  }

  // Mock Data Source
  if (!sl.isRegistered<ScheduleMockDataSource>()) {
    sl.registerLazySingleton<ScheduleMockDataSource>(
      () => ScheduleMockDataSource(),
    );
  }

  // Remote Data Source
  if (!sl.isRegistered<ScheduleRemoteDataSource>()) {
    sl.registerLazySingleton<ScheduleRemoteDataSource>(
      () => ScheduleRemoteDataSource(dio: sl<Dio>()),
    );
  }

  // Repository
  if (!sl.isRegistered<ScheduleRepository>()) {
    sl.registerLazySingleton<ScheduleRepository>(
      () => ScheduleRepositoryImpl(
        remoteDataSource: sl<ScheduleRemoteDataSource>(),
        mockDataSource: sl<ScheduleMockDataSource>(),
      ),
    );
  }

  // Use Case
  if (!sl.isRegistered<GetScheduleUseCase>()) {
    sl.registerLazySingleton<GetScheduleUseCase>(
      () => GetScheduleUseCase(sl<ScheduleRepository>()),
    );
  }

  // Bloc
  if (!sl.isRegistered<ScheduleBloc>()) {
    sl.registerFactory<ScheduleBloc>(
      () => ScheduleBloc(getScheduleUseCase: sl<GetScheduleUseCase>()),
    );
  }
}

/// *
/// TEACHING SCHEDULE
/// *
/// Initialize dependencies for Schedule Teaching module
void initScheduleTeachingModule() {
  // Data source
  sl.registerLazySingleton<ScheduleTeachingRemoteDataSource>(
          () => ScheduleTeachingRemoteDataSource());

  // Repository (register theo interface)
  sl.registerLazySingleton<ScheduleTeachingRepository>(
          () => ScheduleTeachingRepositoryImpl(remoteDataSource: sl()));

  // Use case
  sl.registerLazySingleton(() => GetScheduleTeachingUseCase(repository: sl()));

  // Bloc
  sl.registerFactory(
          () => ScheduleTeachingBloc(getScheduleTeachingUseCase: sl()));
}