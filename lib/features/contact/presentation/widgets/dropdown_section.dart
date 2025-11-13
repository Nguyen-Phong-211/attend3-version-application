import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dropdown_filed.dart';

/// Contains dropdowns for contact type, teacher, subject, and class
class DropdownSection extends StatelessWidget {
  final String? selectedTypePerson;
  final String? selectedTeacher;
  final String? selectedSubject;
  final String? selectedClass;
  final Function(String?) onChangedTypePerson;
  final Function(String?) onChangedTeacher;
  final Function(String?) onChangedSubject;
  final Function(String?) onChangedClass;
  final List<String> typePersons;
  final List<String> teachers;
  final List<String> subjects;
  final List<String> classes;

  const DropdownSection({
    super.key,
    required this.selectedTypePerson,
    required this.selectedTeacher,
    required this.selectedSubject,
    required this.selectedClass,
    required this.onChangedTypePerson,
    required this.onChangedTeacher,
    required this.onChangedSubject,
    required this.onChangedClass,
    required this.typePersons,
    required this.teachers,
    required this.subjects,
    required this.classes,
  });

  @override
  Widget build(BuildContext context) {
    final bool isTeacherSelected = selectedTypePerson == 'Giảng viên';

    return Column(
      children: [
        DropdownFiled(
          hint: 'Chọn người liên hệ',
          items: typePersons,
          value: selectedTypePerson,
          onChanged: onChangedTypePerson,
          iconData: FontAwesomeIcons.userTie,
        ),
        const SizedBox(height: 16),

        if (isTeacherSelected)
          DropdownFiled(
            hint: 'Chọn giảng viên',
            items: teachers,
            value: selectedTeacher,
            onChanged: onChangedTeacher,
            iconData: FontAwesomeIcons.chalkboardUser,
          ),

        if (isTeacherSelected && selectedTeacher != null) ...[
          const SizedBox(height: 16),
          DropdownFiled(
            hint: 'Chọn môn học',
            items: subjects,
            value: selectedSubject,
            onChanged: onChangedSubject,
            iconData: FontAwesomeIcons.bookOpen,
          ),
          const SizedBox(height: 16),
          DropdownFiled(
            hint: 'Chọn lớp dạy',
            items: classes,
            value: selectedClass,
            onChanged: onChangedClass,
            iconData: FontAwesomeIcons.solidCalendar,
          ),
        ],
      ],
    );
  }
}