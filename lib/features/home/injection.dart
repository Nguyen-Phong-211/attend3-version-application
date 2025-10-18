import 'package:get_it/get_it.dart';
import 'package:application/features/home/presentation/providers/home_provider.dart';
import 'package:application/features/home/data/home_repository.dart';
import 'package:application/features/home/data/home_repository_impl.dart';
import 'package:application/features/home/presentation/bloc/home_bloc.dart';

final GetIt locator = GetIt.instance;

void initHomeModule() {
  // Register provider
  if (!locator.isRegistered<HomeProvider>()) {
    locator.registerLazySingleton<HomeProvider>(() => HomeProvider());
  }

  // Register repository (interface -> implementation)
  if (!locator.isRegistered<HomeRepository>()) {
    locator.registerLazySingleton<HomeRepository>(
          () => HomeRepositoryImpl(locator<HomeProvider>()),
    );
  }

  // Register Bloc
  if (!locator.isRegistered<HomeBloc>()) {
    locator.registerFactory<HomeBloc>(
          () => HomeBloc(locator<HomeRepository>()),
    );
  }
}