import 'package:application/features/statistics/data/model/attendance_stat_model.dart';

abstract class StatisticRemoteDataSource {
  Future<List<AttendanceStatModel>> fetchStatistics();
}

class StatisticRemoteDataSourceImpl implements StatisticRemoteDataSource {
  @override
  Future<List<AttendanceStatModel>> fetchStatistics() async {
    // TODO: thay bằng API thật sau này
    await Future.delayed(const Duration(milliseconds: 300));

    return [
      AttendanceStatModel(subject: 'Toán', onTime: 8, late: 1, absent: 0),
      AttendanceStatModel(subject: 'Lý', onTime: 7, late: 2, absent: 1),
      AttendanceStatModel(subject: 'Hóa', onTime: 9, late: 0, absent: 0),
      AttendanceStatModel(subject: 'Tin', onTime: 6, late: 3, absent: 1),
      AttendanceStatModel(subject: 'Anh', onTime: 7, late: 1, absent: 0),
    ];
  }
}