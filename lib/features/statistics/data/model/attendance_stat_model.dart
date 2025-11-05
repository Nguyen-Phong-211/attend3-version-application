import 'package:application/features/statistics/domain/entities/attendance_stat.dart';

class AttendanceStatModel extends AttendanceStat {
  const AttendanceStatModel({
    required super.subject,
    required super.onTime,
    required super.late,
    required super.absent,
  });

  factory AttendanceStatModel.fromJson(Map<String, dynamic> json) {
    return AttendanceStatModel(
      subject: json['subject'],
      onTime: json['onTime'],
      late: json['late'],
      absent: json['absent'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'subject': subject,
      'onTime': onTime,
      'late': late,
      'absent': absent,
    };
  }
}