/// QR Code entity
class QrCodeData {
  final String selectedClass;
  final String selectedSubject;
  final String radius;
  final String note;

  QrCodeData({
    required this.selectedClass,
    required this.selectedSubject,
    required this.radius,
    required this.note,
  });

  Map<String, dynamic> toMap() {
    return {
      'selectedClass': selectedClass,
      'selectedSubject': selectedSubject,
      'radius': radius,
      'note': note,
    };
  }
}