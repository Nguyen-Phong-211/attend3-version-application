import 'package:get_it/get_it.dart';
import 'package:application/features/attendance/data_sources/create_qrcode_remote_data_source.dart';
import 'package:application/features/attendance/domain/use_cases/generate_qr_code_use_case.dart';
import 'presentation/bloc/create_qrcode_bloc.dart';

final sl = GetIt.instance;

/// Initialize dependencies for Attendance module
void initAttendanceModule() {
  /// Data source
  sl.registerLazySingleton<AttendanceRemoteDataSource>(
        () => AttendanceRemoteDataSource(),
  );

  /// Use case
  sl.registerLazySingleton<CreateQrCodeUseCase>(
        () => CreateQrCodeUseCase(remoteDataSource: sl()),
  );

  /// Bloc
  sl.registerFactory<CreateQrCodeBloc>(
        () => CreateQrCodeBloc(),
  );
}