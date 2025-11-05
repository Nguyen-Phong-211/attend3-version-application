import 'package:equatable/equatable.dart';

abstract class StatisticEvent extends Equatable {
  const StatisticEvent();

  @override
  List<Object?> get props => [];
}

// Later you can trigger this event when loading stats from API
class LoadStatisticsEvent extends StatisticEvent {}