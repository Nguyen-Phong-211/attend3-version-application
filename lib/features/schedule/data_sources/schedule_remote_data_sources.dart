import 'package:dio/dio.dart';
import 'package:application/features/schedule/data_sources/schedule_mock_data_source.dart';
import 'package:application/features/schedule/data/models/schedule_model.dart';

class ScheduleRemoteDataSource {
  final Dio dio;
  ScheduleRemoteDataSource({required this.dio});

  Future<List<ScheduleModel>> getSchedules() async {
    // Giai đoạn đầu dùng mock data, sau này thay bằng:
    // final response = await dio.get('/api/schedule');
    // return (response.data as List).map((e) => ScheduleModel.fromJson(e)).toList();

    // Mock tạm
    return mockSchedules.map((e) => ScheduleModel.fromMap(e)).toList();
  }
}