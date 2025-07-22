import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/view/notification/notification_screen.dart';
import 'notification_sort_popup.dart';
import 'package:application/core/constants/app_colors_linear_gradient_constants.dart';
import 'package:application/core/constants/border_radius.dart';

class NotificationHeader extends StatelessWidget {
  final SortOption selectedSort;
  final ValueChanged<SortOption> onSortChanged;

  const NotificationHeader({
    super.key,
    required this.selectedSort,
    required this.onSortChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 24),
      decoration: const BoxDecoration(
        gradient: AppLinearGradient.linearGradient,
        borderRadius: AppBorderRadius.bottom24,
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const FaIcon(FontAwesomeIcons.chevronLeft, color: AppColors.white),
          ),
          const SizedBox(width: 12),
          Text(
            'Thông báo',
            style: TextStyles.titleMedium.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w900,
            ),
          ),
          const Spacer(),
          NotificationSortPopup(
            selectedSort: selectedSort,
            onChanged: onSortChanged,
          ),
        ],
      ),
    );
  }
}
