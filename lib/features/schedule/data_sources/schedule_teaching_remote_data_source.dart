import 'package:application/features/schedule/domain/entities/schedule_teaching_entity.dart';

/// Remote data source responsible for calling APIs.
/// Currently returning mock data for testing UI.
class ScheduleTeachingRemoteDataSource {
  Future<List<ScheduleTeachingEntity>> fetchTeachingSchedules() async {
    await Future.delayed(const Duration(milliseconds: 500)); // Simulate API delay

    // Mock data: represents teaching schedule of a lecturer
    return [
      ScheduleTeachingEntity(
        id: '1',
        courseName: 'Introduction to Flutter',
        slotName: 'Tiết 1-3',
        className: 'FC01',
        date: '2025-11-09',
        startTime: '08:00',
        endTime: '10:00',
        room: 'Room A101',
      ),
      ScheduleTeachingEntity(
        id: '2',
        courseName: 'Advanced PHP Programming',
        slotName: 'Tiết 4-6',
        className: 'FC01',
        date: '2025-11-09',
        startTime: '13:00',
        endTime: '15:00',
        room: 'Room B203',
      ),
      ScheduleTeachingEntity(
        id: '3',
        courseName: 'Database Design',
        slotName: 'Tiết 7-9',
        className: 'FC01',
        date: '2025-11-10',
        startTime: '09:00',
        endTime: '11:00',
        room: 'Room C302',
      ),
    ];
  }
}