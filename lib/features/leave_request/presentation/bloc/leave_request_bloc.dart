import 'package:flutter_bloc/flutter_bloc.dart';
import 'leave_request_event.dart';
import 'leave_request_state.dart';
import 'package:application/features/leave_request/domain/usecases/submit_leave_request.dart';
import 'package:application/features/leave_request/domain/entities/approval_leave_request_entity.dart';
import 'package:application/features/leave_request/data/leave_request_repository.dart';

class LeaveRequestBloc extends Bloc<LeaveRequestEvent, LeaveRequestState> {
  final SubmitLeaveRequest submitLeaveRequest;

  LeaveRequestBloc(this.submitLeaveRequest) : super(const LeaveRequestState()) {
    on<SubjectChanged>((e, emit) => emit(state.copyWith(subject: e.subject)));
    on<TeacherChanged>((e, emit) => emit(state.copyWith(teacher: e.teacher)));
    on<FromDateChanged>((e, emit) => emit(state.copyWith(fromDate: e.fromDate)));
    on<ToDateChanged>((e, emit) => emit(state.copyWith(toDate: e.toDate)));
    on<ReasonChanged>((e, emit) => emit(state.copyWith(reason: e.reason)));

    on<SubmitLeaveRequestPressed>(_onSubmitLeave);
  }

  Future<void> _onSubmitLeave(
      SubmitLeaveRequestPressed event,
      Emitter<LeaveRequestState> emit,
      ) async {
    // Simple validation
    if (state.subject == null ||
        state.teacher == null ||
        state.fromDate == null ||
        state.toDate == null ||
        state.reason.isEmpty) {
      emit(state.copyWith(errorMessage: 'Vui lòng điền đầy đủ thông tin'));
      return;
    }

    emit(state.copyWith(isSubmitting: true, errorMessage: null));

    try {
      final success = await submitLeaveRequest(
        subject: state.subject!,
        teacher: state.teacher!,
        semester: '1',
        year: '2025',
        fromDate: state.fromDate!,
        toDate: state.toDate!,
        reason: state.reason,
      );

      emit(state.copyWith(isSubmitting: false, isSuccess: success));
    } catch (e) {
      emit(state.copyWith(
        isSubmitting: false,
        errorMessage: 'Gửi đơn thất bại: ${e.toString()}',
      ));
    }
  }
}

class ApprovalBloc extends Bloc<ApprovalEvent, ApprovalState> {
  final ApprovalRepository repository;

  ApprovalBloc({required this.repository}) : super(const ApprovalState()) {
    on<LoadApprovalRequests>(_onLoad);
    on<ApplyFilters>(_onApplyFilters);
    on<SelectRequest>(_onSelect);
    on<ClearSelection>((e, emit) => emit(state.copyWith(selectedRequest: null)));
  }

  Future<void> _onLoad(LoadApprovalRequests event, Emitter<ApprovalState> emit) async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final list = await repository.getRequests();
      emit(state.copyWith(
        isLoading: false,
        allRequests: list,
        filteredRequests: list,
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  void _onApplyFilters(ApplyFilters event, Emitter<ApprovalState> emit) {
    final filters = event.filters;

    final selectedClass = filters['class'] as String?;
    final selectedSubject = filters['subject'] as String?;
    final selectedStatus = filters['status'] as String?;
    final selectedName = filters['name'] as String?;
    final DateTime? from = filters['from'] as DateTime?;
    final DateTime? to = filters['to'] as DateTime?;

    final List<ApprovalLeaveRequestEntity> filtered = state.allRequests.where((r) {
      final matchClass =
          selectedClass == null || selectedClass == 'Tất cả' || r.studentClass == selectedClass;

      final matchSubject =
          selectedSubject == null || selectedSubject == 'Tất cả' || r.subject == selectedSubject;

      final matchStatus =
          selectedStatus == null || selectedStatus == 'Tất cả' || r.status == selectedStatus;

      final matchName = selectedName == null ||
          selectedName.isEmpty ||
          r.name.toLowerCase().contains(selectedName.toLowerCase());

      final matchDate = from == null || to == null
          ? true
          : (r.from.isAfter(from.subtract(const Duration(days: 1))) &&
          r.to.isBefore(to.add(const Duration(days: 1))));

      return matchClass && matchSubject && matchStatus && matchName && matchDate;
    }).toList();

    emit(state.copyWith(filteredRequests: filtered, appliedFilters: filters));
  }

  void _onSelect(SelectRequest event, Emitter<ApprovalState> emit) {
    final selected = state.allRequests.firstWhere((e) => e.id == event.id, orElse: () => state.allRequests.isNotEmpty ? state.allRequests.first : throw Exception('Not found'));
    emit(state.copyWith(selectedRequest: selected));
  }
}