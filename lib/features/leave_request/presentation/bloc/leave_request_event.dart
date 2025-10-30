import 'package:equatable/equatable.dart';

// TODO: Leave Request Screen for students
abstract class LeaveRequestEvent extends Equatable {
  const LeaveRequestEvent();

  @override
  List<Object?> get props => [];
}

class SubjectChanged extends LeaveRequestEvent {
  final String? subject;
  const SubjectChanged(this.subject);
}

class TeacherChanged extends LeaveRequestEvent {
  final String? teacher;
  const TeacherChanged(this.teacher);
}

class FromDateChanged extends LeaveRequestEvent {
  final DateTime fromDate;
  const FromDateChanged(this.fromDate);
}

class ToDateChanged extends LeaveRequestEvent {
  final DateTime toDate;
  const ToDateChanged(this.toDate);
}

class ReasonChanged extends LeaveRequestEvent {
  final String reason;
  const ReasonChanged(this.reason);
}

class SubmitLeaveRequestPressed extends LeaveRequestEvent {}

// TODO: Approved Leave Request Screen for lecturers
abstract class ApprovalEvent extends Equatable {
  const ApprovalEvent();
  @override
  List<Object?> get props => [];
}

/// Load initial data
class LoadApprovalRequests extends ApprovalEvent {}

/// Apply filter map: { 'class': String?, 'subject': String?, 'name': String?, 'from': DateTime?, 'to': DateTime? }
class ApplyFilters extends ApprovalEvent {
  final Map<String, dynamic> filters;
  const ApplyFilters(this.filters);
  @override
  List<Object?> get props => [filters];
}

/// Select request to view details (by id)
class SelectRequest extends ApprovalEvent {
  final String id;
  const SelectRequest(this.id);
  @override
  List<Object?> get props => [id];
}

/// Clear selected request
class ClearSelection extends ApprovalEvent {}

/// Create list request
class LoadApprovalListEvent extends ApprovalEvent {}