import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/constants/border_radius.dart';
import 'package:application/features/leave_request/presentation/widgets/leave_dropdown.dart';

class LecturerFilterExport extends StatefulWidget {
  final void Function(String?, String?) onFilter;

  const LecturerFilterExport({super.key, required this.onFilter});

  @override
  State<LecturerFilterExport> createState() => _LecturerFilterExportState();
}

class _LecturerFilterExportState extends State<LecturerFilterExport> {
  String? selectedClass;
  String? selectedSubject;

  final List<String> classes = ['10A1', '10A2', '11B1', '12C3'];
  final List<String> subjects = ['Toán', 'Lý', 'Hóa', 'Anh', 'Tin'];

  void _applyFilter() {
    widget.onFilter(selectedClass, selectedSubject);
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
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _applyFilter,
              icon: const Icon(Icons.filter_alt, color: AppColors.white),
              label:
              const Text('Áp dụng bộ lọc', style: TextStyles.titleButton),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.backgroundPrimaryButton,
                foregroundColor: AppColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: AppBorderRadius.radius12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}