import 'package:flutter/material.dart';
import 'package:application/core/constants/app_colors_linear_gradient_constants.dart';
import 'package:application/core/constants/border_radius.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:application/core/constants/app_label.dart';
import 'package:application/core/constants/app_icons.dart';

typedef FilterCallback = void Function(Map<String, dynamic>?);

class ApprovalHeader extends StatelessWidget {
  final FilterCallback onFilterApplied;
  const ApprovalHeader({Key? key, required this.onFilterApplied}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // keep pure UI and stateless for performance
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
            child: AppIcon.iconScaffoldChevronLeft,
          ),
          const SizedBox(width: 12),
          Text(AppLabel.titleScaffoldLeaveRequest, style: TextStyles.titleScaffold),
        ],
      ),
    );
  }
}