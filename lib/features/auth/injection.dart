import 'package:get_it/get_it.dart';
import 'package:application/features/auth/data/auth_repository.dart';
import 'package:application/features/auth/data/auth_repository_impl.dart';
import 'package:application/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:application/features/auth/presentation/providers/auth_provider.dart';

final GetIt locator = GetIt.instance;

void initAuthModule() {
  // Register provider
  if (!locator.isRegistered<AuthProvider>()) {
    locator.registerLazySingleton<AuthProvider>(() => AuthProvider());
  }

  // Register repository (interface -> implementation)
  if (!locator.isRegistered<AuthRepository>()) {
    locator.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
  }

  // Register Bloc
  if (!locator.isRegistered<AuthBloc>()) {
    locator.registerFactory<AuthBloc>(() => AuthBloc(locator<AuthRepository>()));
  }
}