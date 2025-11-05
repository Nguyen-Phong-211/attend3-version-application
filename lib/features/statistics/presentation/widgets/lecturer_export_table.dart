import 'package:flutter/material.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/features/statistics/domain/entities/attendance_record.dart';

class LecturerExportTable extends StatelessWidget {
  final List<AttendanceRecord> records;

  const LecturerExportTable({super.key, required this.records});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        border: TableBorder.all(color: Colors.grey.shade200),
        columnSpacing: 16,
        headingRowColor:
        WidgetStateProperty.all(AppColors.white),
        columns: const [
          DataColumn(label: Text("Mã số sinh viên", style: TextStyles.titleSmall)),
          DataColumn(label: Text("Họ tên", style: TextStyles.titleSmall)),
          DataColumn(label: Text("Lớp", style: TextStyles.titleSmall)),
          DataColumn(label: Text("Khoa", style: TextStyles.titleSmall)),
          DataColumn(label: Text("Trạng thái", style: TextStyles.titleSmall)),
          DataColumn(label: Text("Hình thức", style: TextStyles.titleSmall)),
          DataColumn(label: Text("Thời gian", style: TextStyles.titleSmall)),
        ],
        rows: records.map((r) {
          return DataRow(cells: [
            DataCell(Text(r.studentId, style: TextStyles.bodyNormal,)),
            DataCell(Text(r.name, style: TextStyles.bodyNormal)),
            DataCell(Text(r.className, style: TextStyles.bodyNormal)),
            DataCell(Text(r.faculty, style: TextStyles.bodyNormal)),
            DataCell(Text(
              r.status,
              style: TextStyle(
                color: r.status == 'Có mặt'
                    ? AppColors.grey
                    : AppColors.error,
                fontSize: 10
              ),
            )),
            DataCell(Text(r.method, style: TextStyles.bodyNormal)),
            DataCell(Text(r.time, style: TextStyles.bodyNormal)),
          ]);
        }).toList(),
      ),
    );
  }
}