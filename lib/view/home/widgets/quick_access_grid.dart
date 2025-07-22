import 'package:application/view/attendance/attendance_by_qrcode_screen.dart';
import 'package:flutter/material.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/view/widgets/custom_button.dart';
import 'package:application/view/home/all_quick_access.dart';
import 'package:application/view/profile/update_profile.dart';

class QuickAccessGrid extends StatelessWidget {
  const QuickAccessGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Truy cập nhanh', style: TextStyles.titleMedium.copyWith(fontWeight: FontWeight.w900)),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AllQuickAccessScreen(),
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
        const SizedBox(height: 16),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 3,
          childAspectRatio: 1,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            CustomButton(
                label: 'Điểm danh QR Code',
                iconPath: 'assets/icons/scan-code.png',
                backgroundColor: Color(0xFFD1C4E9),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AttendanceByQrcodeScreen()
                    ),
                  );
                }),
            CustomButton(
                label: 'Đăng ký khuôn mặt',
                iconPath: 'assets/icons/face-scan.png',
                backgroundColor: Color(0xFFFFCDD2),
                onTap: () {}),
            CustomButton(
                label: 'Xin nghỉ phép',
                iconPath: 'assets/icons/leave.png',
                backgroundColor: Color(0xFFFFF9C4),
                onTap: () {}),
            CustomButton(
                label: 'Liên hệ giảng viên',
                iconPath: 'assets/icons/contact-us.png',
                backgroundColor: Color(0xFFB2EBF2),
                onTap: () {}),
            CustomButton(
                label: 'Lịch học',
                iconPath: 'assets/icons/calendar.png',
                backgroundColor: Color(0xFFDCEDC8),
                onTap: () {}),
            CustomButton(
                label: 'Cập nhật thông tin',
                iconPath: 'assets/icons/literature.png',
                backgroundColor: Color(0xFFFFECB3),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UpdateProfileScreen()
                    ),
                  );
                }),
          ],
        )
      ],
    );
  }
}
