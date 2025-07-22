import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/constants/border_radius.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:application/core/theme/text_styles.dart';

class NotificationCard extends StatelessWidget {
  final Map<String, dynamic> item;

  const NotificationCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final timeStr = DateFormat('dd/MM/yyyy HH:mm').format(item['timestamp']);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppBorderRadius.radius14,
        boxShadow: [
          BoxShadow(color: Colors.grey.shade300, blurRadius: 4),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item['title'], style: TextStyles.titleMedium.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text(item['content'], style: TextStyles.bodyMedium),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.access_time, size: 16, color: AppColors.grey),
              const SizedBox(width: 6),
              Text(timeStr, style: const TextStyle(fontSize: 12, color: AppColors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}