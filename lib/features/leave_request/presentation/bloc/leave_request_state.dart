import 'package:equatable/equatable.dart';

class LeaveRequestState extends Equatable {
  final String? subject;
  final String? teacher;
  final DateTime? fromDate;
  final DateTime? toDate;
  final String reason;
  final bool isSubmitting;
  final bool isSuccess;
  final String? errorMessage;

  const LeaveRequestState({
    this.subject,
    this.teacher,
    this.fromDate,
    this.toDate,
    this.reason = '',
    this.isSubmitting = false,
    this.isSuccess = false,
    this.errorMessage,
  });

  LeaveRequestState copyWith({
    String? subject,
    String? teacher,
    DateTime? fromDate,
    DateTime? toDate,
    String? reason,
    bool? isSubmitting,
    bool? isSuccess,
    String? errorMessage,
  }) {
    return LeaveRequestState(
      subject: subject ?? this.subject,
      teacher: teacher ?? this.teacher,
      fromDate: fromDate ?? this.fromDate,
      toDate: toDate ?? this.toDate,
      reason: reason ?? this.reason,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    subject,
    teacher,
    fromDate,
    toDate,
    reason,
    isSubmitting,
    isSuccess,
    errorMessage,
  ];
}