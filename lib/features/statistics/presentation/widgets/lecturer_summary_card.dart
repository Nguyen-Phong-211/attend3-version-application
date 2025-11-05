import 'package:application/core/constants/border_radius.dart';
// import 'package:application/core/constants/box_shadow_constants.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:application/core/theme/text_styles.dart';

class LecturerSummaryCard extends StatelessWidget {
  final Map<String, int> summary;

  const LecturerSummaryCard({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    final items = [
      {
        'label': 'Tổng số lớp dạy',
        'value': summary['classes'] ?? 0,
        'color': Colors.blueAccent,
        'heroIcon': HeroIcons.bookOpen,
      },
      {
        'label': 'Tổng số sinh viên',
        'value': summary['students'] ?? 120,
        'color': Colors.teal,
        'heroIcon': HeroIcons.userGroup,
      },
      {
        'label': 'Đúng giờ',
        'value': summary['onTime'] ?? 0,
        'color': Colors.green,
        'heroIcon': HeroIcons.checkCircle,
      },
      {
        'label': 'Trễ',
        'value': summary['late'] ?? 0,
        'color': Colors.amber,
        'heroIcon': HeroIcons.clock,
      },
      {
        'label': 'Vắng mặt',
        'value': summary['absent'] ?? 0,
        'color': Colors.redAccent,
        'heroIcon': HeroIcons.xCircle,
      },
      {
        'label': 'Đã duyệt nghỉ phép',
        'value': summary['approvedLeave'] ?? 0,
        'color': Colors.purpleAccent,
        'heroIcon': HeroIcons.checkBadge,
      },
      {
        'label': 'Chưa duyệt nghỉ phép',
        'value': summary['pendingLeave'] ?? 0,
        'color': Colors.orangeAccent,
        'heroIcon': HeroIcons.informationCircle
      },
      {
        'label': 'Từ chối nghỉ phép',
        'value': summary['rejectedLeave'] ?? 0,
        'color': Colors.grey,
        'heroIcon': HeroIcons.xMark
      },
    ];

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: items
          .map(
            (item) => Container(
              width: MediaQuery.of(context).size.width / 2 - 20,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: (item['color'] as Color).withValues(alpha: 0.08),
                borderRadius: AppBorderRadius.radius16,
                // boxShadow: AppShadows.cardShadowGeneralList
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor:
                        (item['color'] as Color).withValues(alpha: 0.15),
                    radius: 15,
                    child: _buildIcon(
                      heroIcon: item['heroIcon'] as HeroIcons?,
                      color: item['color'] as Color,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item['label'] as String,
                            style: TextStyles.bodySmall.copyWith(
                                color: Colors.black87,
                                fontWeight: FontWeight.w500)),
                        const SizedBox(height: 6),
                        Text(
                          '${item['value']}',
                          style: TextStyles.titleMedium.copyWith(
                            color: item['color'] as Color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildIcon({
    HeroIcons? heroIcon,
    required Color color,
  }) {
    return HeroIcon(
      heroIcon ?? HeroIcons.questionMarkCircle,
      style: HeroIconStyle.solid,
      color: color,
      size: 15,
    );
  }
}