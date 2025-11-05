import 'package:application/features/statistics/domain/entities/attendance_stat.dart';

abstract class StatisticRepository {
  Future<List<AttendanceStat>> getAttendanceStatistics();
}