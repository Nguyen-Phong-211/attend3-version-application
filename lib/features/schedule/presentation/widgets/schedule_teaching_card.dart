import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/constants/border_radius.dart';
import 'package:application/core/constants/box_shadow_constants.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:heroicons/heroicons.dart';
import 'package:application/features/schedule/domain/entities/schedule_teaching_entity.dart';

class ScheduleCard extends StatelessWidget {
  final ScheduleTeachingEntity item;
  final VoidCallback? onTap;

  const ScheduleCard({
    super.key,
    required this.item,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isToday = _isToday(item.date);

    final Color borderColor = isToday ? AppColors.primary : AppColors.primary;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppBorderRadius.radius12,
        border: Border(left: BorderSide(color: borderColor, width: 6)),
        boxShadow: AppShadows.cardShadowGeneralList,
      ),
      child: InkWell(
        borderRadius: AppBorderRadius.radius12,
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.courseName,
                style: TextStyles.titleCard.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  const HeroIcon(HeroIcons.clock, size: 14),
                  const SizedBox(width: 6),
                  Text(
                    'Tiết: ${item.slotName}',
                    style: TextStyles.bodyNormal,
                  ),
                ],
              ),
              const SizedBox(height: 3),
              Row(
                children: [
                  const HeroIcon(HeroIcons.clock, size: 14),
                  const SizedBox(width: 6),
                  Text(
                    'Lớp: ${item.className}',
                    style: TextStyles.bodyNormal,
                  ),
                ],
              ),
              const SizedBox(height: 3),
              Row(
                children: [
                  const HeroIcon(HeroIcons.clock, size: 14),
                  const SizedBox(width: 6),
                  Text(
                    'Thời gian: ${item.startTime} - ${item.endTime}',
                    style: TextStyles.bodyNormal,
                  ),
                ],
              ),
              const SizedBox(height: 3),
              Row(
                children: [
                  const HeroIcon(HeroIcons.mapPin, size: 14),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      'Phòng: ${item.room}',
                      style: TextStyles.bodyNormal,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              if (isToday)
                Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    borderRadius: AppBorderRadius.radius8,
                    border: Border.all(
                      color: AppColors.primary.withValues(alpha: 0.6),
                    ),
                  ),
                  child: Text(
                    'Hôm nay',
                    style: TextStyles.bodySuperSmall.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  bool _isToday(String? dateString) {
    if (dateString == null) return false;
    try {
      final parsed = DateFormat('yyyy-MM-dd').parse(dateString);
      final now = DateTime.now();
      return parsed.year == now.year &&
          parsed.month == now.month &&
          parsed.day == now.day;
    } catch (_) {
      return false;
    }
  }
}