import 'package:application/features/leave_request/data/leave_request_repository.dart';
import 'package:application/features/leave_request/data_sources/leave_request_remote_data_source.dart';
import 'package:application/features/leave_request/domain/entities/approval_leave_request_entity.dart';

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

class ApprovalRepositoryImpl implements ApprovalRepository {
  final ApprovalRemoteDataSource remote;

  ApprovalRepositoryImpl({required this.remote});

  @override
  Future<List<ApprovalLeaveRequestEntity>> getRequests() async {
    final raw = await remote.fetchRequestsMock();

    // convert Map to entity
    return raw.map((m) {
      return ApprovalLeaveRequestEntity(
        id: m.id.toString(),
        name: m.name,
        studentClass: m.studentClass,
        subject: m.subject,
        from: m.from,
        to: m.to,
        reason: m.reason,
        status: m.status,
      );
    }).toList();
  }
}