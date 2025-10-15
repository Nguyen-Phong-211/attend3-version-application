import 'package:get_it/get_it.dart';
import 'package:application/features/auth/data/auth_repository.dart';
import 'package:application/features/auth/data/auth_repository_impl.dart';
import 'package:application/features/auth/presentation/bloc/auth_bloc.dart';

final GetIt locator = GetIt.instance;

void initAuthModule() {
  // Register repository (interface -> implementation)
  if (!locator.isRegistered<AuthRepository>()) {
    locator.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
  }

  // Register Bloc
  if (!locator.isRegistered<AuthBloc>()) {
    locator.registerFactory<AuthBloc>(() => AuthBloc(locator<AuthRepository>()));
  }
}