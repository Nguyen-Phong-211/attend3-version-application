import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/constants/app_colors_linear_gradient_constants.dart';
import 'package:application/core/constants/border_radius.dart';
import 'package:application/core/constants/app_label.dart';
import 'package:application/core/theme/text_styles.dart';

class StatisticStudentHeader extends StatelessWidget {
  const StatisticStudentHeader({super.key});

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
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const FaIcon(FontAwesomeIcons.chevronLeft,
                color: AppColors.white),
          ),
          const SizedBox(width: 12),
          const Text(AppLabel.titleScaffoldStatistic,
              style: TextStyles.titleScaffold),
        ],
      ),
    );
  }
}