/// *
/// STUDY SCHEDULE
/// *
class ScheduleEntity {
  final String title;
  final String lessonSlot;
  final String className;
  final String time;
  final String host;
  final String location;
  final String date;
  final String deadTime;

  ScheduleEntity({
    required this.title,
    required this.lessonSlot,
    required this.className,
    required this.time,
    required this.host,
    required this.location,
    required this.date,
    required this.deadTime,
  });

  /// Convert ScheduleEntity to Map<String, String> to use in ScheduleCard
  Map<String, String> toMap() {
    return {
      'title': title,
      'lessonSlot': lessonSlot,
      'class': className,
      'time': time,
      'host': host,
      'location': location,
      'date': date,
      'deadTime': deadTime,
    };
  }

/// Create ScheduleEntity from ScheduleModel (if needed)
// factory ScheduleEntity.fromModel(ScheduleModel models) {
//   return ScheduleEntity(
//     title: models.title,
//     lessonSlot: models.lessonSlot,
//     className: models.className,
//     time: models.time,
//     host: models.host,
//     location: models.location,
//     date: models.date,
//     deadTime: models.deadTime,
//   );
// }
}