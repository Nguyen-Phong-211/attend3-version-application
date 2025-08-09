import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/constants/border_radius.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:application/core/constants/box_shadow_constants.dart';

class NotificationCard extends StatelessWidget {
  final Map<String, dynamic> item;

  const NotificationCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final timeStr = DateFormat('dd/MM/yyyy HH:mm').format(item['timestamp']);

    return Container(
      height: 120,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border: Border(
            left: BorderSide(color: AppColors.primary, width: 6),
        ),
        borderRadius: AppBorderRadius.radius8,
        color: AppColors.white,
        boxShadow: CardShadows.cardShadowList,
      ),

      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item['title'], style: TextStyles.titleSmall),
          const SizedBox(height: 6),
          Text(item['content'], style: TextStyles.bodyNormal),
          const Spacer(),
          Row(
            children: [
              const Icon(Icons.access_time, size: 16, color: AppColors.grey),
              const SizedBox(width: 6),
              Text(
                timeStr,
                style: const TextStyle(fontSize: 12, color: AppColors.grey),
              ),
            ],
          ),
        ],
      ),
    );

  }
}