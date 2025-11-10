import 'package:equatable/equatable.dart';
import 'package:application/features/schedule/domain/entities/schedule_teaching_entity.dart';

/// States for ScheduleTeachingBloc
abstract class ScheduleTeachingState extends Equatable {
  const ScheduleTeachingState();

  @override
  List<Object?> get props => [];
}

class ScheduleTeachingInitial extends ScheduleTeachingState {}

class ScheduleTeachingLoading extends ScheduleTeachingState {}

class ScheduleTeachingLoaded extends ScheduleTeachingState {
  final List<ScheduleTeachingEntity> schedules;

  const ScheduleTeachingLoaded(this.schedules);

  @override
  List<Object?> get props => [schedules];
}

class ScheduleTeachingError extends ScheduleTeachingState {
  final String message;

  const ScheduleTeachingError(this.message);

  @override
  List<Object?> get props => [message];
}