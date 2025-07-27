import 'package:flutter/material.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/constants/app_colors_linear_gradient_constants.dart';
import 'package:application/core/constants/border_radius.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactLecturerScreen extends StatefulWidget {
  const ContactLecturerScreen({super.key});

  @override
  State<ContactLecturerScreen> createState() => _ContactLecturerScreenState();
}

class _ContactLecturerScreenState extends State<ContactLecturerScreen> {
  String? selectedSemester;
  String? selectedYear;
  String? selectedSubject;
  String? selectedTeacher;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  final List<String> semesters = ['Học kỳ 1', 'Học kỳ 2', 'Học kỳ hè'];
  final List<String> years = ['2022 - 2023', '2023 - 2024', '2024 - 2025'];
  final List<String> subjects = ['Lập trình Flutter', 'Cấu trúc dữ liệu', 'Toán rời rạc'];
  final List<String> teachers = ['Thầy Nam', 'Cô Huyền', 'Thầy Sơn'];

  void _submitContact() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Đã gửi liên hệ đến giảng viên')),
    );
  }

  Widget _buildDropdown({
    required String hint,
    required List<String> items,
    required String? value,
    required Function(String?) onChanged,
    required IconData iconData,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      isExpanded: true,
      icon: const FaIcon(FontAwesomeIcons.chevronDown, color: AppColors.black, size: 14),
      style: TextStyles.hintTextInput.copyWith(color: AppColors.black, fontFamily: 'Quicksand'),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyles.hintTextInput.copyWith(color: Colors.grey),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 12, right: 8),
          child: FaIcon(iconData, color: AppColors.primary, size: 18),
        ),
        prefixIconConstraints: const BoxConstraints(minWidth: 40),
        contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: AppBorderRadius.radius12,
          borderSide: const BorderSide(color: Color(0xFFBDBDBD), width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppBorderRadius.radius12,
          borderSide: const BorderSide(color: AppColors.inputFocus, width: 2),
        ),
      ),
      dropdownColor: Colors.white,
      borderRadius: AppBorderRadius.radius12,
      onChanged: onChanged,
      items: items.map((item) => DropdownMenuItem<String>(
        value: item,
        child: Text(item, style: TextStyles.titleInput.copyWith(color: AppColors.black)),
      )).toList(),
      selectedItemBuilder: (BuildContext context) {
        return items.map((item) {
          return Align(
            alignment: Alignment.centerLeft,
            child: Text(item, style: TextStyles.titleInput.copyWith(color: AppColors.black)),
          );
        }).toList();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(16, 48, 16, 24),
              decoration: const BoxDecoration(
                gradient: AppLinearGradient.linearGradient,
                borderRadius: AppBorderRadius.borderRadiusBottomLeftRight24,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const FaIcon(FontAwesomeIcons.chevronLeft, color: AppColors.white),
                  ),
                  const SizedBox(width: 12),
                  Text('Liên hệ giảng viên', style: TextStyles.titleScaffold),
                ],
              ),
            ),

            const SizedBox(height: 24),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  _buildDropdown(
                    hint: 'Chọn học kỳ',
                    items: semesters,
                    value: selectedSemester,
                    onChanged: (val) => setState(() => selectedSemester = val),
                    iconData: FontAwesomeIcons.calendarDays,
                  ),
                  const SizedBox(height: 16),

                  _buildDropdown(
                    hint: 'Chọn năm học',
                    items: years,
                    value: selectedYear,
                    onChanged: (val) => setState(() => selectedYear = val),
                    iconData: FontAwesomeIcons.solidCalendar,
                  ),
                  const SizedBox(height: 16),

                  _buildDropdown(
                    hint: 'Chọn môn học',
                    items: subjects,
                    value: selectedSubject,
                    onChanged: (val) => setState(() => selectedSubject = val),
                    iconData: FontAwesomeIcons.bookOpen,
                  ),
                  const SizedBox(height: 16),

                  _buildDropdown(
                    hint: 'Chọn giảng viên',
                    items: teachers,
                    value: selectedTeacher,
                    onChanged: (val) => setState(() => selectedTeacher = val),
                    iconData: FontAwesomeIcons.chalkboardUser,
                  ),
                  const SizedBox(height: 16),

                  TextField(
                    controller: titleController,
                    style: TextStyles.titleInput,
                    decoration: InputDecoration(
                      hintText: 'Tiêu đề liên hệ',
                      hintStyle: TextStyles.hintTextInput.copyWith(color: Colors.grey),
                      prefixIcon: const Icon(Icons.subject, color: AppColors.primary),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.all(16),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: AppBorderRadius.radius12,
                        borderSide: const BorderSide(color: Color(0xFFBDBDBD), width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: AppBorderRadius.radius12,
                        borderSide: const BorderSide(color: AppColors.inputFocus, width: 2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  TextField(
                    controller: messageController,
                    maxLines: 6,
                    style: TextStyles.titleInput,
                    decoration: InputDecoration(
                      hintText: 'Nội dung liên hệ',
                      hintStyle: TextStyles.hintTextInput.copyWith(color: Colors.grey),
                      prefixIcon: const Icon(Icons.message_rounded, color: AppColors.primary),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.all(16),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: AppBorderRadius.radius12,
                        borderSide: const BorderSide(color: Color(0xFFBDBDBD), width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: AppBorderRadius.radius12,
                        borderSide: const BorderSide(color: AppColors.inputFocus, width: 2),
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: _submitContact,
                      icon: const FaIcon(FontAwesomeIcons.paperPlane, color: Colors.white),
                      label: Text(
                        'Gửi liên hệ',
                        style: TextStyles.titleMedium.copyWith(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: AppColors.backgroundPrimaryButton,
                        shape: RoundedRectangleBorder(
                          borderRadius: AppBorderRadius.radius12,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}