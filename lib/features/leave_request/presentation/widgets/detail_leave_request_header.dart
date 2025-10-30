import 'package:flutter/material.dart';
import 'package:application/core/constants/app_colors_linear_gradient_constants.dart';
import 'package:application/core/constants/border_radius.dart';
import 'package:application/core/constants/app_icons.dart';
import 'package:application/core/theme/text_styles.dart';

class DetailLeaveRequestHeader extends StatelessWidget {
  final String title;
  final VoidCallback onBack;

  const DetailLeaveRequestHeader({super.key, required this.title, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 24),
      decoration: const BoxDecoration(
        gradient: AppLinearGradient.linearGradient,
        borderRadius: AppBorderRadius.borderRadiusBottomLeftRight24,
      ),
      child: Row(
        children: [
          GestureDetector(onTap: onBack, child: AppIcon.iconScaffoldChevronLeft),
          const SizedBox(width: 12),
          Text(title, style: TextStyles.titleScaffold),
        ],
      ),
    );
  }
}