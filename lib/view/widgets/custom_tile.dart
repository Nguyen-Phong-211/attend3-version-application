import 'package:flutter/material.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:application/core/constants/border_radius.dart';
import 'package:application/core/constants/box_shadow_constants.dart';

class CustomCardTaskToday extends StatelessWidget {
  final String subject;
  final String teacher;
  final String time;
  final VoidCallback? onTap;

  const CustomCardTaskToday({
    super.key,
    required this.subject,
    required this.teacher,
    required this.time,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: AppBorderRadius.radius12,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.lightGreen,
          borderRadius: AppBorderRadius.radius12,
          boxShadow: AppShadows.cardShadowList,
        ),
        child: Row(
          children: [
            const Icon(Icons.access_time, color: Colors.redAccent, size: 16,),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Môn: $subject', style: TextStyles.bodyMedium.copyWith(fontWeight: FontWeight.bold)),
                  Text('Giảng viên: $teacher', style: TextStyles.bodySmall),
                  Text('Vào lúc $time', style: TextStyles.bodySmall.copyWith(fontStyle: FontStyle.italic)),
                ],
              ),
            ),
            const FaIcon(FontAwesomeIcons.chevronRight, size: 16),
          ],
        ),
      ),
    );
  }
}