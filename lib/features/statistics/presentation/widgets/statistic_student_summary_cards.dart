import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:application/core/constants/border_radius.dart';

class StatisticStudentSummaryCards extends StatelessWidget {
  final int absentCount;
  final int lateCount;
  final int onTimeCount;

  const StatisticStudentSummaryCards({
    super.key,
    required this.absentCount,
    required this.lateCount,
    required this.onTimeCount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _StatCard(
              icon: FontAwesomeIcons.userXmark,
              color: Colors.redAccent,
              label: 'Vắng mặt',
              value: absentCount.toString()),
          _StatCard(
              icon: FontAwesomeIcons.clock,
              color: Colors.amber,
              label: 'Trễ',
              value: lateCount.toString()),
          _StatCard(
              icon: FontAwesomeIcons.userCheck,
              color: Colors.green,
              label: 'Đúng giờ',
              value: onTimeCount.toString()),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;
  final String value;

  const _StatCard({
    required this.icon,
    required this.color,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: AppBorderRadius.radius18,
          border: Border.all(color: color.withValues(alpha: 0.4), width: 1),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 15),
            const SizedBox(height: 8),
            Text(value, style: TextStyles.titleMedium.copyWith(color: color)),
            Text(label, style: TextStyles.bodySmall.copyWith(color: color)),
          ],
        ),
      ),
    );
  }
}