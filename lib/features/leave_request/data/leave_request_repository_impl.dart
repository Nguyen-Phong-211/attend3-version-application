import 'package:application/features/leave_request/data/leave_request_repository.dart';
import 'package:application/features/leave_request/data_sources/leave_request_remote_data_source.dart';

class LeaveRequestRepositoryImpl implements LeaveRequestRepository {
  final LeaveRequestRemoteDataSource remoteDataSource;

  LeaveRequestRepositoryImpl({required this.remoteDataSource});

  @override
  Future<bool> submitLeaveRequest({
    required String subject,
    required String teacher,
    required String semester,
    required String year,
    required DateTime fromDate,
    required DateTime toDate,
    required String reason,
  }) async {
    try {
      return await remoteDataSource.submitLeaveRequest(
        subject: subject,
        teacher: teacher,
        semester: semester,
        year: year,
        fromDate: fromDate,
        toDate: toDate,
        reason: reason,
      );
    } catch (e) {
      rethrow;
    }
  }
}