import 'package:application/core/constants/border_radius.dart';
import 'package:flutter/material.dart';
import 'row_icon_text.dart';
import 'package:application/core/constants/box_shadow_constants.dart';
import 'package:application/core/constants/app_colors.dart';

class ScheduleCard extends StatelessWidget {
  final Map<String, String> item;

  const ScheduleCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {

    return IntrinsicHeight(
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: Row(
          children: [
            Container(
              width: 6,
              height: 115,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              ),
            ),

            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(
                    color: AppColors.grey.withValues(alpha: 0.3),
                  ),
                  borderRadius: AppBorderRadius.radius14,
                  boxShadow: CardShadows.cardShadowList,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RowIconText(icon: Icons.access_time, text: item['time'] ?? ''),
                    const SizedBox(height: 8),
                    RowIconText(icon: Icons.menu_book_outlined, text: item['title'] ?? ''),
                    const SizedBox(height: 8),
                    RowIconText(icon: Icons.person_outline, text: 'Giảng viên: ${item['host']}'),
                    const SizedBox(height: 8),
                    RowIconText(icon: Icons.location_on_outlined, text: 'Phòng: ${item['location']}'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}