import 'package:application/features/statistics/domain/entities/attendance_stat.dart';
import 'package:application/features/statistics/data_sources/statistic_remote_data_source.dart';
import 'statistic_repository.dart';

class StatisticRepositoryImpl implements StatisticRepository {
  final StatisticRemoteDataSource remoteDataSource;

  StatisticRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<AttendanceStat>> getAttendanceStatistics() async {
    return await remoteDataSource.fetchStatistics();
  }
}