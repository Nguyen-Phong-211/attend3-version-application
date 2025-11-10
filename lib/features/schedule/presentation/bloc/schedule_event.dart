import 'package:equatable/equatable.dart';

/// *
/// STUDY SCHEDULE
/// *
abstract class ScheduleEvent extends Equatable {
  const ScheduleEvent();

  @override
  List<Object?> get props => [];
}

class FetchScheduleEvent extends ScheduleEvent {
  const FetchScheduleEvent();
}

class RefreshScheduleEvent extends ScheduleEvent {
  const RefreshScheduleEvent();
}