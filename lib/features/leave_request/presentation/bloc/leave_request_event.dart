import 'package:equatable/equatable.dart';

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