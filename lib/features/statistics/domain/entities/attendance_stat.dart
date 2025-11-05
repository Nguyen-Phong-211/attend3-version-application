import 'package:equatable/equatable.dart';

class AttendanceStat extends Equatable {
  final String subject;
  final int onTime;
  final int late;
  final int absent;

  const AttendanceStat({
    required this.subject,
    required this.onTime,
    required this.late,
    required this.absent,
  });

  @override
  List<Object?> get props => [subject, onTime, late, absent];
}