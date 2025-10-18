import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:application/core/constants/app_label.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/view/widgets/custom_tile.dart';
import 'package:application/view/attendance/attendance_screen.dart';
import 'package:application/view/attendance/attendance_by_camera_screen.dart';

class TodaySchedule extends StatelessWidget {
  final List<String> schedules; // data from BLoC

  const TodaySchedule({super.key, required this.schedules});

  String getTodayFormatted() {
    return DateFormat('dd/MM/yyyy').format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Hôm nay, ${getTodayFormatted()}. Bạn sẽ',
                style: TextStyles.titleMedium.copyWith(fontWeight: FontWeight.w900)),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AttendanceScreen()),
                );
              },
              child: Text(
                AppLabel.titleViewAll,
                style: TextStyles.titleSmall.copyWith(color: AppColors.textPrimaryColor),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        if (schedules.isEmpty)
          const Text(
            'No schedule today.', // TODO: Replace if API returns no data
            style: TextStyle(color: Colors.grey),
          )
        else
          Column(
            children: schedules.map((schedule) {
              // TODO: Replace mock split logic when API returns structured data
              final subject = schedule;
              final teacher = 'Unknown'; // TODO: from API
              final time = '---'; // TODO: from API

              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: CustomCardTaskToday(
                  subject: subject,
                  teacher: teacher,
                  time: time,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AttendanceByCameraScreen(
                          subject: subject,
                          teacher: teacher,
                          time: time,
                        ),
                      ),
                    );
                  },
                ),
              );
            }).toList(),
          ),
      ],
    );
  }
}