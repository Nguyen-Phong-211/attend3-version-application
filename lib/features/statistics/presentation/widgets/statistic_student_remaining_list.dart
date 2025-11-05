import 'package:application/core/constants/border_radius.dart';
import 'package:flutter/material.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/theme/text_styles.dart';

class StatisticStudentRemainingList extends StatelessWidget {
  final Map<String, int> dayOffBySubject;

  const StatisticStudentRemainingList({super.key, required this.dayOffBySubject});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: dayOffBySubject.length,
        separatorBuilder: (_, __) => const Divider(height: 12),
        itemBuilder: (context, index) {
          final subject = dayOffBySubject.keys.elementAt(index);
          final remaining = dayOffBySubject[subject]!;
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: AppBorderRadius.radius12,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(subject, style: TextStyles.titleMedium),
                Text(
                  '$remaining ngày',
                  style: TextStyles.titleMedium.copyWith(
                    color: remaining == 0 ? Colors.red : AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}