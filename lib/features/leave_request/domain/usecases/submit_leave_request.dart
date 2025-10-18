import 'package:application/features/leave_request/data/leave_request_repository.dart';

class SubmitLeaveRequest {
  final LeaveRequestRepository repository;

  SubmitLeaveRequest(this.repository);

  Future<bool> call({
    required String subject,
    required String teacher,
    required String semester,
    required String year,
    required DateTime fromDate,
    required DateTime toDate,
    required String reason,
  }) {
    return repository.submitLeaveRequest(
      subject: subject,
      teacher: teacher,
      semester: semester,
      year: year,
      fromDate: fromDate,
      toDate: toDate,
      reason: reason,
    );
  }
}