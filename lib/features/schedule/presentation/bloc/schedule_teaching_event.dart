import 'package:equatable/equatable.dart';

/// Events for ScheduleTeachingBloc
abstract class ScheduleTeachingEvent extends Equatable {
  const ScheduleTeachingEvent();

  @override
  List<Object?> get props => [];
}

/// Fetch all teaching schedules
class FetchTeachingScheduleEvent extends ScheduleTeachingEvent {}

/// Refresh schedule list
class RefreshTeachingScheduleEvent extends ScheduleTeachingEvent {}