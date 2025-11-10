import 'package:application/features/schedule/domain/entities/schedule_entity.dart';

/// *
/// STUDY SCHEDULE
/// *
abstract class ScheduleRepository {
  Future<List<ScheduleEntity>> getSchedules({bool useMock = false});
}