import 'package:get_it/get_it.dart';
import 'package:application/features/auth/data/auth_repository.dart';

final GetIt locator = GetIt.instance;

void initAuthModule() {
  // Register AuthRepository
  if (!locator.isRegistered<AuthRepository>()) {
    locator.registerLazySingleton<AuthRepository>(() => AuthRepository());
  }
}