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
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppBorderRadius.radius16,
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
    );
  }
}