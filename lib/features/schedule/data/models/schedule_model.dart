import 'package:application/features/schedule/domain/entities/schedule_entity.dart';

class ScheduleModel {
  final String title;
  final String lessonSlot;
  final String className;
  final String time;
  final String host;
  final String location;
  final String date;
  final String deadTime;

  ScheduleModel({
    required this.title,
    required this.lessonSlot,
    required this.className,
    required this.time,
    required this.host,
    required this.location,
    required this.date,
    required this.deadTime,
  });

  //
  factory ScheduleModel.fromMap(Map<String, dynamic> map) {
    return ScheduleModel(
      title: map['title'] ?? '',
      lessonSlot: map['lessonSlot'] ?? '',
      className: map['class'] ?? '',
      time: map['time'] ?? '',
      host: map['host'] ?? '',
      location: map['location'] ?? '',
      date: map['date'] ?? '',
      deadTime: map['deadTime'] ?? '',
    );
  }

  //
  ScheduleEntity toEntity() {
    return ScheduleEntity(
      title: title,
      lessonSlot: lessonSlot,
      className: className,
      time: time,
      host: host,
      location: location,
      date: date,
      deadTime: deadTime,
    );
  }

  //
  factory ScheduleModel.fromEntity(ScheduleEntity entity) {
    return ScheduleModel(
      title: entity.title,
      lessonSlot: entity.lessonSlot,
      className: entity.className,
      time: entity.time,
      host: entity.host,
      location: entity.location,
      date: entity.date,
      deadTime: entity.deadTime,
    );
  }
}