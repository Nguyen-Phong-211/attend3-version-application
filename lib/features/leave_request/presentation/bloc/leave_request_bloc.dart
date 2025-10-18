import 'package:flutter_bloc/flutter_bloc.dart';
import 'leave_request_event.dart';
import 'leave_request_state.dart';
import 'package:application/features/leave_request/domain/usecases/submit_leave_request.dart';

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