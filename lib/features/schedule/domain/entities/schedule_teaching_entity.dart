class ScheduleTeachingEntity {
  final String id;
  final String courseName;
  final String slotName;
  final String className;
  final String date;
  final String startTime;
  final String endTime;
  final String room;

  ScheduleTeachingEntity({
    required this.id,
    required this.courseName,
    required this.slotName,
    required this.className,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.room,
  });

  factory ScheduleTeachingEntity.fromJson(Map<String, dynamic> json) {
    return ScheduleTeachingEntity(
      id: json['id'] ?? '',
      courseName: json['course_name'] ?? '',
      slotName: json['slot_name'] ?? '',
      className: json['class_name'] ?? '',
      date: json['date'] ?? '',
      startTime: json['start_time'] ?? '',
      endTime: json['end_time'] ?? '',
      room: json['room'] ?? '',
    );
  }

  // Convert to Map for ScheduleCard
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'course_name': courseName,
      'slot_name': slotName,
      'class_name': className,
      'date': date,
      'start_time': startTime,
      'end_time': endTime,
      'room': room,
    };
  }
}