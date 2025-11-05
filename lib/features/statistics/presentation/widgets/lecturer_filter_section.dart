import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/constants/border_radius.dart';
import 'package:application/features/leave_request/presentation/widgets/leave_dropdown.dart';

class LecturerFilterSection extends StatefulWidget {
  final void Function(String?, String?, DateTimeRange?) onFilter;

  const LecturerFilterSection({super.key, required this.onFilter});

  @override
  State<LecturerFilterSection> createState() => _LecturerFilterSectionState();
}

class _LecturerFilterSectionState extends State<LecturerFilterSection> {
  String? selectedClass;
  String? selectedSubject;
  DateTimeRange? selectedRange;

  final List<String> classes = ['10A1', '10A2', '11B1', '12C3'];
  final List<String> subjects = ['Toán', 'Lý', 'Hóa', 'Anh', 'Tin'];

  void _applyFilter() {
    widget.onFilter(selectedClass, selectedSubject, selectedRange);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0.3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: LeaveDropdown(
                    hint: "Chọn lớp",
                    items: classes,
                    value: selectedClass,
                    iconData: FontAwesomeIcons.school,
                    onChanged: (v) => setState(() => selectedClass = v),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: LeaveDropdown(
                    hint: "Chọn môn học",
                    items: subjects,
                    value: selectedSubject,
                    iconData: FontAwesomeIcons.bookOpen,
                    onChanged: (v) => setState(() => selectedSubject = v),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            _buildDatePicker(context),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: _applyFilter,
              icon: const Icon(Icons.filter_alt, color: AppColors.white),
              label: const Text('Áp dụng bộ lọc', style: TextStyles.titleButton),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.backgroundPrimaryButton,
                foregroundColor: AppColors.white,
                shape: RoundedRectangleBorder(borderRadius: AppBorderRadius.radius12),
              ),
              // child: const Text(AppLabel.titleButtonApplyFilter, style: TextStyles.titleButton),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDatePicker(BuildContext context) {
    return InkWell(
      borderRadius: AppBorderRadius.radius12,
      onTap: () async {
        final now = DateTime.now();
        final picked = await showDateRangePicker(
          context: context,
          firstDate: DateTime(now.year - 1),
          lastDate: DateTime(now.year + 1),
          initialDateRange: selectedRange ??
              DateTimeRange(start: now.subtract(const Duration(days: 7)), end: now),
        );
        if (picked != null) {
          setState(() => selectedRange = picked);
        }
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: AppBorderRadius.radius12,
          border: Border.all(color: Colors.grey.shade300, width: 1.5),
        ),
        child: Row(
          children: [
            const FaIcon(FontAwesomeIcons.calendarDays, color: AppColors.primary, size: 12),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                selectedRange == null
                    ? 'Chọn khoảng thời gian'
                    : '${DateFormat('dd/MM/yyyy').format(selectedRange!.start)} - ${DateFormat('dd/MM/yyyy').format(selectedRange!.end)}',
                style: selectedRange == null
                    ? TextStyles.hintTextInput.copyWith(color: Colors.grey.shade500)
                    : TextStyles.titleInput.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
            const FaIcon(FontAwesomeIcons.circleChevronDown,
                size: 12, color: AppColors.primary),
          ],
        ),
      ),
    );
  }
}