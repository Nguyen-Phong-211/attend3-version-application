import 'package:application/features/schedule/data/models/schedule_model.dart';

class ScheduleMockDataSource {
  Future<List<ScheduleModel>> getMockSchedules() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return mockSchedules.map((e) => ScheduleModel.fromMap(e)).toList();
  }
}

// Sample data
final List<Map<String, dynamic>> mockSchedules = [
  {
    'title': 'Lập trình Flutter',
    'lessonSlot': '1 - 3',
    'className': 'FLUT01',
    'time': '07:30 - 09:00',
    'host': 'ThS. Nguyễn Phong',
    'location': 'Phòng A101',
    'date': '2025-11-07',
    'deadTime': '1 giờ',
  },
  {
    'title': 'Cấu trúc dữ liệu & Giải thuật',
    'lessonSlot': '4 - 6',
    'className': 'CTDL02',
    'time': '09:15 - 10:45',
    'host': 'TS. Trần Văn B',
    'location': 'Phòng C202',
    'date': '2025-11-08',
    'deadTime': '2 giờ',
  },
  {
    'title': 'Cơ sở dữ liệu',
    'lessonSlot': '7 - 9',
    'className': 'CSDL03',
    'time': '13:00 - 15:30',
    'host': 'TS. Lê Thị C',
    'location': 'Phòng B301',
    'date': '2025-11-09',
    'deadTime': '3 giờ',
  },
];