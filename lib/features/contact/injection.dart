// Dependency injection for the Contact module

import 'package:get_it/get_it.dart';
import 'package:application/features/contact/data/contact_repository.dart';
import 'package:application/features/contact/data/contact_repository_impl.dart';
import 'package:application/features/contact/data_sources/contact_remote_data_source.dart';
import 'package:application/features/contact/domain/usecases/send_contact_usecase.dart';
import 'package:application/features/contact/presentation/bloc/contact_bloc.dart';

final sl = GetIt.instance;

void initContactModule() {
  // Data Source
  sl.registerLazySingleton(() => ContactRemoteDataSource());

  // Repository
  sl.registerLazySingleton<ContactRepository>(
          () => ContactRepositoryImpl(remoteDataSource: sl()));

  // Use Case
  sl.registerLazySingleton(() => SendContactUseCase(repository: sl()));

  // Bloc
  sl.registerFactory(() => ContactBloc(sendContactUseCase: sl()));
}