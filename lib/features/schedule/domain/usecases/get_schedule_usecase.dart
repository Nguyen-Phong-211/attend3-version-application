import 'package:application/features/schedule/domain/entities/schedule_entity.dart';
import 'package:application/features/schedule/data/schedule_repository.dart';

/// *
/// STUDY SCHEDULE
/// *
class GetScheduleUseCase {
  final ScheduleRepository repository;

  GetScheduleUseCase(this.repository);

  Future<List<ScheduleEntity>> call({bool useMock = false}) {
    return repository.getSchedules(useMock: useMock);
  }
}
