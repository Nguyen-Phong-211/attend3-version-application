import 'package:flutter/material.dart';
import 'package:application/features/statistics/domain/entities/attendance_stat.dart';
import 'package:application/features/statistics/data/statistic_repository.dart';

class StatisticProvider extends ChangeNotifier {
  final StatisticRepository repository;

  StatisticProvider(this.repository);

  bool isLoading = false;
  List<AttendanceStat> statistics = [];

  // Variable temp
  int absentCount = 5;
  int lateCount = 3;
  int onTimeCount = 20;

  Map<String, int> dayOffBySubject = {
    'Toán': 2,
    'Lý': 1,
    'Hóa': 0,
    'Tin': 3,
    'Anh': 1,
  };

  Future<void> fetchStatistics() async {
    isLoading = true;
    notifyListeners();

    try {
      statistics = await repository.getAttendanceStatistics();

      // TODO: Then update statistics with real data
      // Example: absentCount = statistics.where(...).length;

    } catch (e) {
      debugPrint('Error fetching statistics: $e');
    }

    isLoading = false;
    notifyListeners();
  }

  // Lecturer's statistic

  bool hasData = false;

  Map<String, int> summary = {
    'classes': 0,
    'onTime': 0,
    'absent': 0,
    'leave': 0,
    'late': 0,
  };

  List<Map<String, dynamic>> studentStats = [];
  List<Map<String, dynamic>> classStats = [];

  void applyFilter(String? className, String? subject, DateTimeRange? range) {
    hasData = true;

    summary = {
      'classes': 5,
      'onTime': 42,
      'absent': 8,
      'leave': 3,
      'late': 7,
    };

    // Fake student stats
    studentStats = List.generate(15, (i) {
      return {
        'name': 'SV${i + 1}',
        'onTime': (5 + i) % 10,
        'late': (i % 3) + 1,
        'absent': (i % 2),
      };
    });

    // Fake class/subject stats
    classStats = [
      {'label': '10A1 - Toán', 'onTime': 22, 'late': 5, 'absent': 3},
      {'label': '10A1 - Anh', 'onTime': 18, 'late': 7, 'absent': 4},
      {'label': '11B1 - Hóa', 'onTime': 25, 'late': 3, 'absent': 2},
    ];
  }

  Future<void> loadDefaultClassStats() async {
    isLoading = true;
    notifyListeners();

    // Sample data for classStats
    await Future.delayed(const Duration(milliseconds: 300));
    classStats = [
      {'label': '10A1 - Toán', 'onTime': 25, 'late': 5, 'absent': 3},
      {'label': '11B1 - Anh', 'onTime': 22, 'late': 7, 'absent': 2},
      {'label': '12C3 - Hóa', 'onTime': 28, 'late': 3, 'absent': 4},
    ];

    isLoading = false;
    notifyListeners();
  }
}