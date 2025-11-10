import 'package:application/features/schedule/domain/entities/schedule_teaching_entity.dart';

/// Abstract repository interface for fetching teaching schedules.
abstract class ScheduleTeachingRepository {
  /// Returns a list of teaching schedules.
  Future<List<ScheduleTeachingEntity>> getTeachingSchedules();
}