import 'package:flutter/material.dart';
import 'package:application/features/schedule/domain/entities/schedule_entity.dart';
import 'package:application/features/schedule/domain/usecases/get_schedule_usecase.dart';

class ScheduleProvider extends ChangeNotifier {
  final GetScheduleUseCase getScheduleUseCase;

  ScheduleProvider({required this.getScheduleUseCase});

  List<ScheduleEntity> schedules = [];
  bool isLoading = false;
  String? error;

  Future<void> loadSchedules({bool useMock = false}) async {
    try {
      isLoading = true;
      notifyListeners();

      schedules = await getScheduleUseCase(useMock: useMock);
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}