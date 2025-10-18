import 'package:get_it/get_it.dart';
import 'package:application/features/leave_request/data_sources/leave_request_remote_data_source.dart';
import 'package:application/features/leave_request/data/leave_request_repository_impl.dart';
import 'package:application/features/leave_request/data/leave_request_repository.dart';
import 'package:application/features/leave_request/domain/usecases/submit_leave_request.dart';
import 'package:application/features/leave_request/presentation/bloc/leave_request_bloc.dart';

final sl = GetIt.instance;

void initLeaveRequestModule() {
  // Data source
  if (!sl.isRegistered<LeaveRequestRemoteDataSource>()) {
    sl.registerLazySingleton<LeaveRequestRemoteDataSource>(
          () => LeaveRequestRemoteDataSource(),
    );
  }

  // Repository
  if (!sl.isRegistered<LeaveRequestRepository>()) {
    sl.registerLazySingleton<LeaveRequestRepository>(
          () => LeaveRequestRepositoryImpl(remoteDataSource: sl()),
    );
  }

  // Usecase
  if (!sl.isRegistered<SubmitLeaveRequest>()) {
    sl.registerLazySingleton<SubmitLeaveRequest>(
          () => SubmitLeaveRequest(sl<LeaveRequestRepository>()),
    );
  }

  // Bloc
  if (!sl.isRegistered<LeaveRequestBloc>()) {
    sl.registerFactory<LeaveRequestBloc>(
          () => LeaveRequestBloc(sl<SubmitLeaveRequest>()),
    );
  }
}