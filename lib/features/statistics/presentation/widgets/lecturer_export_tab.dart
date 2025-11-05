import 'dart:io';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/constants/border_radius.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:application/features/statistics/presentation/widgets/lecturer_filter_export.dart';
import 'package:application/features/statistics/presentation/widgets/lecturer_export_table.dart';
import 'package:application/features/statistics/domain/entities/attendance_record.dart';
import 'package:application/core/constants/app_images.dart';
import 'package:application/core/constants/app_label.dart';
import 'package:application/features/widgets/scaffold_messages.dart';
import 'package:excel/excel.dart';
import 'package:path_provider/path_provider.dart';

class LecturerExportTab extends StatefulWidget {
  const LecturerExportTab({super.key});

  @override
  State<LecturerExportTab> createState() => _LecturerExportTabState();
}

class _LecturerExportTabState extends State<LecturerExportTab> {
  String? selectedClass;
  String? selectedSubject;
  List<AttendanceRecord> records = [];

  /// When the user clicks Apply filter
  void _onFilter(String? className, String? subject) async {
    setState(() {
      selectedClass = className;
      selectedSubject = subject;
    });

    if (className == null || subject == null) {
      ScaffoldMessages.informError(context, 'Vui lòng chọn đầy đủ lớp và môn học');
      return;
    }

    // TODO: Replace with API call in the future
    final sampleData = List.generate(15, (index) {
      return AttendanceRecord(
        studentId: 'SV${1000 + index}',
        name: 'Nguyễn Văn ${String.fromCharCode(65 + index)}',
        className: className,
        faculty: 'Công nghệ thông tin',
        status: index % 2 == 0 ? 'Có mặt' : 'Vắng',
        method: index % 2 == 0 ? 'QR Code' : 'Face ID',
        time: '08:${(10 + index).toString().padLeft(2, '0')} 05/11/2025',
      );
    });

    setState(() => records = sampleData);
  }

  /// Export Excel file
  Future<void> _exportExcel() async {
    try {
      final excel = Excel.createExcel();
      final sheet = excel['DiemDanh'];

      // Header
      sheet.appendRow([
        TextCellValue('Mã số sinh viên'),
        TextCellValue('Họ tên'),
        TextCellValue('Lớp'),
        TextCellValue('Khoa'),
        TextCellValue('Trạng thái'),
        TextCellValue('Phương thức'),
        TextCellValue('Thời gian điểm danh'),
      ]);

      // Body
      for (final r in records) {
        sheet.appendRow([
          TextCellValue(r.studentId),
          TextCellValue(r.name),
          TextCellValue(r.className),
          TextCellValue(r.faculty),
          TextCellValue(r.status),
          TextCellValue(r.method),
          TextCellValue(r.time),
        ]);
      }

      // Font + Style (avoid error format)
      final cellStyle = CellStyle(
        fontFamily: getFontFamily(FontFamily.Calibri),
        horizontalAlign: HorizontalAlign.Center,
      );
      sheet.cell(CellIndex.indexByString("A1")).cellStyle = cellStyle;

      // Lưu file
      final dir = await getApplicationDocumentsDirectory();
      final filePath = "${dir.path}/DiemDanh_${DateTime.now().millisecondsSinceEpoch}.xlsx";
      final fileBytes = excel.encode();
      final file = File(filePath);
      await file.writeAsBytes(fileBytes!);

      if (context.mounted) {
        ScaffoldMessages.informSuccess(context, "Xuất file thành công");
      }
    } catch (e) {
      ScaffoldMessages.informError(context, "Lỗi khi xuất file: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LecturerFilterExport(onFilter: _onFilter),
          const SizedBox(height: 16),

          /// Horizontal scroll table
          Expanded(
            child: records.isNotEmpty
                ? SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: 950,
                child: LecturerExportTable(records: records),
              ),
            )
                : Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    AppImages.imageIconEmptyData,
                    width: 60,
                    height: 60,
                    color: Colors.grey.shade400,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    AppLabel.titleReturnEmptyData,
                    style: TextStyles.titleSmall.copyWith(
                      color: Colors.grey.shade400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 10),

          /// File export button (disabled when no data)
          ElevatedButton.icon(
            onPressed: records.isEmpty ? null : _exportExcel,
            icon: const HeroIcon(
              HeroIcons.arrowDownOnSquareStack,
              color: AppColors.white,
            ),
            label: const Text("Xuất ra Excel (.xlsx)", style: TextStyles.titleButton),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.backgroundPrimaryButton,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: AppBorderRadius.radius12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
