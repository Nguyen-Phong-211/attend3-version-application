import 'package:flutter/material.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/constants/app_colors_linear_gradient_constants.dart';
import 'package:application/core/constants/border_radius.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:application/core/constants/box_shadow_constants.dart';

class LeaveScreen extends StatefulWidget {
  const LeaveScreen({super.key});

  @override
  State<LeaveScreen> createState() => _LeaveScreenState();
}

class _LeaveScreenState extends State<LeaveScreen> {
  String? selectedSemester;
  String? selectedYear;
  String? selectedSubject;
  String? selectedTeacher;

  DateTime? fromDate;
  DateTime? toDate;

  final TextEditingController reasonController = TextEditingController();

  final List<String> semesters = ['Học kỳ 1', 'Học kỳ 2', 'Học kỳ hè'];
  final List<String> years = ['2022 - 2023', '2023 - 2024', '2024 - 2025'];
  final List<String> subjects = ['Lập trình Flutter', 'Cấu trúc dữ liệu', 'Toán rời rạc'];
  final List<String> teachers = ['Thầy Nam', 'Cô Huyền', 'Thầy Sơn'];

  Future<void> pickDate({required bool isFrom}) async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year - 1),
      lastDate: DateTime(now.year + 1),
    );
    if (picked != null) {
      setState(() {
        if (isFrom) {
          fromDate = picked;
        } else {
          toDate = picked;
        }
      });
    }
  }

  void _submitLeaveRequest() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Đã gửi đơn xin nghỉ phép')),
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
      icon: const FaIcon(
        FontAwesomeIcons.chevronDown,
        color: AppColors.black,
        size: 14,
      ),
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
      items: items
          .map(
            (item) => DropdownMenuItem<String>(
          value: item,
          child: Text(
            item,
            style: TextStyles.titleInput.copyWith(color: AppColors.black),
          ),
        ),
      ).toList(),

      selectedItemBuilder: (BuildContext context) {
        return items.map((item) {
          return Align(
            alignment: Alignment.centerLeft,
            child: Text(
              item,
              style: TextStyles.titleInput.copyWith(color: AppColors.black),
            ),
          );
        }).toList();
      },
    );
  }

  Widget _buildDateField(String hint, DateTime? date, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: InputDecorator(
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyles.hintTextInput,
          prefixIcon: const Icon(Icons.date_range, color: AppColors.primary),
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
        child: Text(
          date != null ? "${date.day}/${date.month}/${date.year}" : hint,
          style: TextStyles.titleInput.copyWith(
            color: date != null ? AppColors.black : Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _buildLeaveFormPreview() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppBorderRadius.radius12,
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: AppShadows.cardShadowList,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM',
            style: TextStyles.titleMedium.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Độc lập - Tự do - Hạnh phúc',
            style: TextStyles.titleInput.copyWith(
              fontStyle: FontStyle.italic,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'ĐƠN XIN NGHỈ PHÉP',
            style: TextStyles.titleMedium.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              decoration: TextDecoration.underline,
            ),
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Kính gửi: ${selectedTeacher ?? '....................................................'}", style: TextStyles.titleInput),
                const SizedBox(height: 8),
                Text("Em là sinh viên học môn: ${selectedSubject ?? '....................................................'}", style: TextStyles.titleInput),
                const SizedBox(height: 8),
                Text("Học kỳ: ${selectedSemester ?? '........'}, Năm học: ${selectedYear ?? '....................'}", style: TextStyles.titleInput),
                const SizedBox(height: 8),
                Text(
                  "Em làm đơn này xin phép được nghỉ từ ngày: "
                      "${fromDate != null ? "${fromDate!.day}/${fromDate!.month}/${fromDate!.year}" : "__/__/____"} "
                      "đến ngày: ${toDate != null ? "${toDate!.day}/${toDate!.month}/${toDate!.year}" : "__/__/____"}.",
                  style: TextStyles.titleInput,
                ),
                const SizedBox(height: 8),
                Text(
                  "Lý do: ${reasonController.text.isNotEmpty ? reasonController.text : ".............................................................................."}",
                  style: TextStyles.titleInput,
                ),
                const SizedBox(height: 8),
                Text(
                  "Em xin cam kết hoàn thành đầy đủ bài học và bài tập trong thời gian nghỉ. "
                      "Rất mong thầy/cô xem xét và chấp thuận.",
                  style: TextStyles.titleInput,
                ),
                const SizedBox(height: 24),
                Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "TP.HCM, ngày ${DateTime.now().day} tháng ${DateTime.now().month} năm ${DateTime.now().year}",
                        style: TextStyles.titleInput,
                      ),
                      const SizedBox(height: 8),
                      Text("Sinh viên ký tên", style: TextStyles.titleInput.copyWith(fontStyle: FontStyle.italic)),
                      const SizedBox(height: 8),
                      Text("Nguyễn Văn A", style: TextStyles.titleInput.copyWith(fontStyle: FontStyle.italic)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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
                  Text('Xin nghỉ phép', style: TextStyles.titleScaffold),
                ],
              ),
            ),

            _buildLeaveFormPreview(),

            const SizedBox(height: 32),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  _buildDropdown(
                    hint: 'Chọn học kỳ',
                    items: semesters,
                    value: selectedSemester,
                    onChanged: (val) => setState(() => selectedSemester = val),
                    iconData: FontAwesomeIcons.parachuteBox,
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
                    iconData: FontAwesomeIcons.book,
                  ),
                  const SizedBox(height: 16),

                  _buildDropdown(
                    hint: 'Chọn giảng viên',
                    items: teachers,
                    value: selectedTeacher,
                    onChanged: (val) => setState(() => selectedTeacher = val),
                    iconData: FontAwesomeIcons.personChalkboard,
                  ),
                  const SizedBox(height: 16),

                  Row(
                    children: [
                      Expanded(child: _buildDateField('Từ ngày', fromDate, () => pickDate(isFrom: true))),
                      const SizedBox(width: 12),
                      FaIcon(FontAwesomeIcons.caretRight),
                      const SizedBox(width: 12),
                      Expanded(child: _buildDateField('Đến ngày', toDate, () => pickDate(isFrom: false))),
                    ],
                  ),
                  const SizedBox(height: 16),

                  TextField(
                    controller: reasonController,
                    maxLines: 7,
                    style: TextStyles.titleInput,
                    decoration: InputDecoration(
                      hintText: 'Lý do vắng mặt',
                      hintStyle: TextStyles.hintTextInput.copyWith(color: Colors.grey),
                      prefixIcon: const Icon(Icons.edit_note_rounded, color: AppColors.primary),
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
                      onPressed: _submitLeaveRequest,
                      icon: const FaIcon(FontAwesomeIcons.paperPlane, color: AppColors.white,),
                      label: Text(
                        'Gửi đơn nghỉ phép',
                        style: TextStyles.titleMedium.copyWith(
                          color: Colors.white,
                        ),
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