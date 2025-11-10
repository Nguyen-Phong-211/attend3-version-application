import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:application/features/schedule/domain/usecases/get_schedule_teaching_usecase.dart';
import 'package:application/features/schedule/presentation/bloc/schedule_teaching_event.dart';
import 'package:application/features/schedule/presentation/bloc/schedule_teaching_state.dart';

/// Bloc to manage teaching schedule state
class ScheduleTeachingBloc
    extends Bloc<ScheduleTeachingEvent, ScheduleTeachingState> {
  final GetScheduleTeachingUseCase getScheduleTeachingUseCase;

  ScheduleTeachingBloc({required this.getScheduleTeachingUseCase})
      : super(ScheduleTeachingInitial()) {
    on<FetchTeachingScheduleEvent>(_onFetchTeachingSchedule);
    on<RefreshTeachingScheduleEvent>(_onRefreshTeachingSchedule);
  }

  Future<void> _onFetchTeachingSchedule(
      FetchTeachingScheduleEvent event,
      Emitter<ScheduleTeachingState> emit) async {
    emit(ScheduleTeachingLoading());
    try {
      final schedules = await getScheduleTeachingUseCase();
      emit(ScheduleTeachingLoaded(schedules));
    } catch (e) {
      emit(ScheduleTeachingError('Failed to load data: $e'));
    }
  }

  Future<void> _onRefreshTeachingSchedule(
      RefreshTeachingScheduleEvent event,
      Emitter<ScheduleTeachingState> emit) async {
    try {
      final schedules = await getScheduleTeachingUseCase();
      emit(ScheduleTeachingLoaded(schedules));
    } catch (e) {
      emit(ScheduleTeachingError('Failed to refresh: $e'));
    }
  }
}