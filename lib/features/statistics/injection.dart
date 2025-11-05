import 'package:get_it/get_it.dart';
import 'package:application/features/statistics/data_sources/statistic_remote_data_source.dart';
import 'package:application/features/statistics/data/statistic_repository.dart';
import 'package:application/features/statistics/data/statistic_repository_impl.dart';
import 'package:application/features/statistics/presentation/provider/statistic_provider.dart';
import 'package:application/features/statistics/presentation/bloc/statistic_bloc.dart';

final GetIt locator = GetIt.instance;

void initStatisticModule() {
  // Register Remote Data Source
  if (!locator.isRegistered<StatisticRemoteDataSource>()) {
    locator.registerLazySingleton<StatisticRemoteDataSource>(
          () => StatisticRemoteDataSourceImpl(),
    );
  }

  // Register Repository (interface -> implementation)
  if (!locator.isRegistered<StatisticRepository>()) {
    locator.registerLazySingleton<StatisticRepository>(
          () => StatisticRepositoryImpl(locator<StatisticRemoteDataSource>()),
    );
  }

  // Register Provider (for current usage)
  if (!locator.isRegistered<StatisticProvider>()) {
    locator.registerLazySingleton<StatisticProvider>(
          () => StatisticProvider(locator<StatisticRepository>()),
    );
  }

  // Register Bloc (prepared for later BLoC migration)
  if (!locator.isRegistered<StatisticBloc>()) {
    locator.registerFactory<StatisticBloc>(
          () => StatisticBloc(locator<StatisticRepository>()),
    );
  }
}