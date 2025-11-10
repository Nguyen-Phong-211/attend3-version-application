import 'package:flutter/material.dart';
import 'package:application/features/schedule/domain/usecases/get_schedule_teaching_usecase.dart';
import 'package:application/features/schedule/domain/entities/schedule_teaching_entity.dart';

/// Provider to inject the teaching schedule bloc into the widget tree.
class ScheduleTeachingProvider extends ChangeNotifier {
  final GetScheduleTeachingUseCase getScheduleTeachingUseCase;

  ScheduleTeachingProvider({required this.getScheduleTeachingUseCase}) {
    fetchSchedules();
  }

  List<ScheduleTeachingEntity> schedules = [];
  bool isLoading = false;
  String? error;

  Future<void> fetchSchedules() async {
    isLoading = true;
    notifyListeners();
    try {
      schedules = await getScheduleTeachingUseCase();
      error = null;
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}