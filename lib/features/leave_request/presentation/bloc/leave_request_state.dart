import 'package:equatable/equatable.dart';
import 'package:application/features/leave_request/domain/entities/approval_leave_request_entity.dart';

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

class ApprovalState extends Equatable {
  final bool isLoading;
  final List<ApprovalLeaveRequestEntity> allRequests;
  final List<ApprovalLeaveRequestEntity> filteredRequests;
  final ApprovalLeaveRequestEntity? selectedRequest;
  final Map<String, dynamic>? appliedFilters;
  final String? error;

  const ApprovalState({
    this.isLoading = false,
    this.allRequests = const [],
    this.filteredRequests = const [],
    this.selectedRequest,
    this.appliedFilters,
    this.error,
  });

  ApprovalState copyWith({
    bool? isLoading,
    List<ApprovalLeaveRequestEntity>? allRequests,
    List<ApprovalLeaveRequestEntity>? filteredRequests,
    ApprovalLeaveRequestEntity? selectedRequest,
    Map<String, dynamic>? appliedFilters,
    String? error,
  }) {
    return ApprovalState(
      isLoading: isLoading ?? this.isLoading,
      allRequests: allRequests ?? this.allRequests,
      filteredRequests: filteredRequests ?? this.filteredRequests,
      selectedRequest: selectedRequest ?? this.selectedRequest,
      appliedFilters: appliedFilters ?? this.appliedFilters,
      error: error,
    );
  }

  @override
  List<Object?> get props =>
      [isLoading, allRequests, filteredRequests, selectedRequest, appliedFilters, error];
}