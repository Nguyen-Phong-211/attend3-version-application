import 'package:application/features/leave_request/domain/entities/leave_request_entity.dart';

abstract class ILeaveRequestRepository {
  Future<List<LeaveRequestEntity>> getLeaveRequests();
  Future<void> approveLeaveRequest(String id);
  Future<void> rejectLeaveRequest(String id);
}