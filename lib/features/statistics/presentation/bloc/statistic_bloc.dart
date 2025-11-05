import 'package:flutter_bloc/flutter_bloc.dart';
import 'statistic_event.dart';
import 'statistic_state.dart';
import 'package:application/features/statistics/data/statistic_repository.dart';

// This Bloc is not yet used in UI.
// Later you can migrate from Provider to Bloc easily by injecting this.
class StatisticBloc extends Bloc<StatisticEvent, StatisticState> {
  final StatisticRepository repository;

  StatisticBloc(this.repository) : super(StatisticInitial()) {
    on<LoadStatisticsEvent>(_onLoadStatistics);
  }

  Future<void> _onLoadStatistics(
      LoadStatisticsEvent event, Emitter<StatisticState> emit) async {
    emit(StatisticLoading());
    try {
      final data = await repository.getAttendanceStatistics();
      emit(StatisticLoaded(data));
    } catch (e) {
      emit(StatisticError('Failed to load statistics.'));
    }
  }
}