import 'package:application/features/schedule/data/schedule_repository.dart';
import 'package:application/features/schedule/data_sources/schedule_remote_data_sources.dart';
import 'package:application/features/schedule/data_sources/schedule_mock_data_source.dart';
import 'package:application/features/schedule/domain/entities/schedule_entity.dart';

class ScheduleRepositoryImpl implements ScheduleRepository {
  final ScheduleRemoteDataSource remoteDataSource;
  final ScheduleMockDataSource mockDataSource;

  ScheduleRepositoryImpl({
    required this.remoteDataSource,
    required this.mockDataSource,
  });

  @override
  Future<List<ScheduleEntity>> getSchedules({bool useMock = false}) async {
    try {
      /// If useMock is enabled, use mock data always
      if (useMock) {
        final mock = await mockDataSource.getMockSchedules();
        return mock.map((m) => m.toEntity()).toList();
      }

      final data = await remoteDataSource.getSchedules();
      return data.map((m) => m.toEntity()).toList();
    } catch (_) {
      /// fallback to mock if error
      final mock = await mockDataSource.getMockSchedules();
      return mock.map((m) => m.toEntity()).toList();
    }
  }
}