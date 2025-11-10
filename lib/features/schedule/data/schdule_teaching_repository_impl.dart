import 'package:application/features/schedule/data/schedule_teaching_repository.dart';
import 'package:application/features/schedule/data_sources/schedule_teaching_remote_data_source.dart';
import 'package:application/features/schedule/domain/entities/schedule_teaching_entity.dart';

/// Repository implementation for teaching schedules.
/// Currently uses mock data from the remote data source.
class ScheduleTeachingRepositoryImpl implements ScheduleTeachingRepository {
  final ScheduleTeachingRemoteDataSource remoteDataSource;

  ScheduleTeachingRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<ScheduleTeachingEntity>> getTeachingSchedules() async {
    // Fetch fake/mock data for now
    return await remoteDataSource.fetchTeachingSchedules();
  }
}