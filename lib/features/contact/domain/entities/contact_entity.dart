// Entity representing a contact form submission.
// Keeps only business-level data, no UI logic.

class ContactEntity {
  final String typePerson;
  final String? teacher;
  final String? subject;
  final String? className;
  final String title;
  final String message;

  ContactEntity({
    required this.typePerson,
    this.teacher,
    this.subject,
    this.className,
    required this.title,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      'typePerson': typePerson,
      'teacher': teacher,
      'subject': subject,
      'className': className,
      'title': title,
      'message': message,
    };
  }
}