import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:application/features/schedule/domain/usecases/get_schedule_usecase.dart';
import 'package:application/features/schedule/presentation/bloc/schedule_event.dart';
import 'package:application/features/schedule/presentation/bloc/schedule_state.dart';

/// *
/// STUDY SCHEDULE
/// *
class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  final GetScheduleUseCase getScheduleUseCase;

  ScheduleBloc({required this.getScheduleUseCase}) : super(ScheduleInitial()) {
    on<FetchScheduleEvent>(_onFetchSchedule);
    on<RefreshScheduleEvent>(_onRefreshSchedule);
  }

  Future<void> _onFetchSchedule(
      FetchScheduleEvent event, Emitter<ScheduleState> emit) async {
    emit(ScheduleLoading());
    try {
      final schedules = await getScheduleUseCase();
      emit(ScheduleLoaded(schedules));
    } catch (e) {
      emit(ScheduleError('Không thể tải dữ liệu: $e'));
    }
  }

  Future<void> _onRefreshSchedule(
      RefreshScheduleEvent event, Emitter<ScheduleState> emit) async {
    try {
      final schedules = await getScheduleUseCase();
      emit(ScheduleLoaded(schedules));
    } catch (e) {
      emit(ScheduleError('Làm mới thất bại: $e'));
    }
  }
}