import 'package:application/features/schedule/data/schedule_teaching_repository.dart';
import 'package:application/features/schedule/domain/entities/schedule_teaching_entity.dart';

/// Use case for getting teaching schedules.
class GetScheduleTeachingUseCase {
  final ScheduleTeachingRepository repository;

  GetScheduleTeachingUseCase({required this.repository});

  Future<List<ScheduleTeachingEntity>> call() async {
    return await repository.getTeachingSchedules();
  }
}