import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/constants/app_colors_linear_gradient_constants.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:application/core/constants/border_radius.dart';
import 'package:application/view/widgets/custom_tile.dart';
import 'attendance_by_camera_screen.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // HEADER
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
                  child: const FaIcon(
                    FontAwesomeIcons.chevronLeft,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'Buổi điểm danh trong hôm nay',
                  style: TextStyles.titleScaffold,
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // TITLE
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Bạn có 6 buổi điểm danh trong hôm nay',
              style: TextStyles.titleMedium.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
          ),

          const SizedBox(height: 12),

          // FILTER + STATUS
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.pink.shade100,
                    borderRadius: AppBorderRadius.radius20,
                  ),
                  child: const Text('Điểm danh: 1/6', style: TextStyles.titleSmall,),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // ATTENDANCE CARDS
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: sampleSubjects.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final item = sampleSubjects[index];
                return CustomCardTaskToday(
                  subject: item['subject']!,
                  teacher: item['teacher']!,
                  time: item['time']!,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AttendanceByCameraScreen(
                          subject: item['subject']!,
                          teacher: item['teacher']!,
                          time: item['time']!,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

final List<Map<String, String>> sampleSubjects = [
  {
    'subject': 'Lập trình di động',
    'teacher': 'Nguyễn Văn A',
    'time': '07:30',
  },
  {
    'subject': 'Trí tuệ nhân tạo',
    'teacher': 'Nguyễn Thị B',
    'time': '09:30',
  },
  {
    'subject': 'Hệ thống nhúng',
    'teacher': 'Nguyễn Văn C',
    'time': '13:00',
  },
];