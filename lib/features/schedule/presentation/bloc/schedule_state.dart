import 'package:equatable/equatable.dart';
import 'package:application/features/schedule/domain/entities/schedule_entity.dart';

/// *
/// SCHEDULE SCHEDULE
/// *
abstract class ScheduleState extends Equatable {
  const ScheduleState();

  @override
  List<Object?> get props => [];
}

class ScheduleInitial extends ScheduleState {}

class ScheduleLoading extends ScheduleState {}

class ScheduleLoaded extends ScheduleState {
  final List<ScheduleEntity> schedules;

  const ScheduleLoaded(this.schedules);

  @override
  List<Object?> get props => [schedules];
}

class ScheduleError extends ScheduleState {
  final String message;

  const ScheduleError(this.message);

  @override
  List<Object?> get props => [message];
}