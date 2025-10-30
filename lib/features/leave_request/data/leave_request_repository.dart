import 'package:application/features/leave_request/domain/entities/approval_leave_request_entity.dart';

abstract class LeaveRequestRepository {
  Future<bool> submitLeaveRequest({
    required String subject,
    required String teacher,
    required String semester,
    required String year,
    required DateTime fromDate,
    required DateTime toDate,
    required String reason,
  });
}

abstract class ApprovalRepository {
  Future<List<ApprovalLeaveRequestEntity>> getRequests();
  // For now we do not implement approve/reject here because UI only preview + filter.
  // Later you can add:
  // Future<bool> updateRequestStatus(String id, bool approved);
}