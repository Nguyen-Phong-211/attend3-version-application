import 'package:flutter/material.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/constants/app_colors_linear_gradient_constants.dart';
import 'package:application/core/constants/border_radius.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class AttendanceHistoryDetailScreen extends StatelessWidget {
  final Map<String, dynamic> detail;

  const AttendanceHistoryDetailScreen({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    final timeStr = DateFormat('dd/MM/yyyy HH:mm').format(detail['timestamp']);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          // Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(16, 48, 16, 24),
            decoration: const BoxDecoration(
              gradient: AppLinearGradient.linearGradient,
              borderRadius: AppBorderRadius.bottom24,
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const FaIcon(FontAwesomeIcons.chevronLeft, color: AppColors.white),
                ),
                const SizedBox(width: 12),
                Text('Chi tiết điểm danh', style: TextStyles.titleScaffold),
              ],
            ),
          ),

          // Body
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildInfoRow('Năm học', detail['academicYear']),
                _buildInfoRow('Học kỳ', detail['semester']),
                _buildInfoRow('Môn học', detail['subject']),
                _buildInfoRow('Giờ điểm danh', timeStr),
                _buildInfoRow('Giảng viên', detail['teacher']),
                _buildInfoRow('Phòng học', detail['room']),
                _buildInfoRow('Hình thức điểm danh', detail['method']),
                _buildStatusRow('Trạng thái', detail['status']),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppBorderRadius.radius14,
        boxShadow: [
          BoxShadow(color: Colors.grey.shade200, blurRadius: 4),
        ],
      ),
      child: Row(
        children: [
          Expanded(child: Text(label, style: TextStyles.bodyNormal)),
          Text(value, style: TextStyles.titleSmall),
        ],
      ),
    );
  }

  Widget _buildStatusRow(String label, String status) {
    final isSuccess = status.toLowerCase() == 'có mặt';
    final color = isSuccess ? Colors.green : Colors.red;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppBorderRadius.radius14,
        boxShadow: [
          BoxShadow(color: Colors.grey.shade200, blurRadius: 4),
        ],
      ),
      child: Row(
        children: [
          Expanded(child: Text(label, style: TextStyles.bodyNormal)),
          Text(
            status,
            style: TextStyles.titleSmall.copyWith(color: color),
          ),
        ],
      ),
    );
  }
}
