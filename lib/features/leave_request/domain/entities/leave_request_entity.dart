class LeaveRequestEntity {
  final String id;
  final String studentName;
  final String subject;
  final String className;
  final DateTime date;
  final String timeOff;
  final String reason;
  final bool isApproved;

  LeaveRequestEntity({
    required this.id,
    required this.studentName,
    required this.subject,
    required this.className,
    required this.date,
    required this.timeOff,
    required this.reason,
    required this.isApproved,
  });
}