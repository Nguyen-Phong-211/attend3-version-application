class ApprovalLeaveRequestEntity {
  final String id;
  final String name;
  final String studentClass;
  final String subject;
  final DateTime from;
  final DateTime to;
  final String reason;
  final String status; // pending, approved, rejected

  const ApprovalLeaveRequestEntity({
    required this.id,
    required this.name,
    required this.studentClass,
    required this.subject,
    required this.from,
    required this.to,
    required this.reason,
    required this.status,
  });
}