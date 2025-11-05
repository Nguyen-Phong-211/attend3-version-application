import 'package:equatable/equatable.dart';
import 'package:application/features/statistics/domain/entities/attendance_stat.dart';

abstract class StatisticState extends Equatable {
  const StatisticState();

  @override
  List<Object?> get props => [];
}

// Initial empty state
class StatisticInitial extends StatisticState {}

// Loading state while fetching data
class StatisticLoading extends StatisticState {}

// Loaded successfully with data
class StatisticLoaded extends StatisticState {
  final List<AttendanceStat> statistics;

  const StatisticLoaded(this.statistics);

  @override
  List<Object?> get props => [statistics];
}

// Error state
class StatisticError extends StatisticState {
  final String message;

  const StatisticError(this.message);

  @override
  List<Object?> get props => [message];
}