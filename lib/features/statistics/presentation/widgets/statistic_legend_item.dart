import 'package:application/core/constants/border_radius.dart';
import 'package:flutter/material.dart';
import 'package:application/core/theme/text_styles.dart';

class StatisticLegendItem extends StatelessWidget {
  final Color color;
  final String label;

  const StatisticLegendItem({super.key, required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            borderRadius: AppBorderRadius.radius8,
          ),
        ),
        const SizedBox(width: 6),
        Text(label, style: TextStyles.bodySmall),
      ],
    );
  }
}