import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:application/view/widgets/custom_tile.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/view/attendance/attendance_screen.dart';
import 'package:application/view/attendance/attendance_by_camera_screen.dart';

class TodaySchedule extends StatelessWidget {
  const TodaySchedule({super.key});

  String getTodayFormatted() {
    DateTime now = DateTime.now();
    return DateFormat('dd/MM/yyyy').format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Hôm nay, ${getTodayFormatted()}. Bạn sẽ', style: TextStyles.titleMedium.copyWith(fontWeight: FontWeight.w900)),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AttendanceScreen(),
                  ),
                );
              },
              child: Text(
                'Xem tất cả',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimaryColor,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        CustomTile(
          subject: 'Toán cao cấp 1',
          teacher: 'Nguyễn Văn A',
          time: '13:00 07/07/2025',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AttendanceByCameraScreen(
                  subject: 'Toán cao cấp 1',
                  teacher: 'Nguyễn Văn A',
                  time: '13:00 07/07/2025',
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 8),
        CustomTile(
          subject: 'Toán ứng dụng',
          teacher: 'Nguyễn Hồng B',
          time: '15:00 07/07/2025',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AttendanceByCameraScreen(
                  subject: 'Toán ứng dụng',
                  teacher: 'Nguyễn Hồng B',
                  time: '15:00 07/07/2025',
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}