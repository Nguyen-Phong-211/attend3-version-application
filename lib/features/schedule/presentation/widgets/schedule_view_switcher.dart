import 'package:flutter/material.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:application/features/schedule/domain/entities/view_mode.dart';

class ScheduleViewSwitcher extends StatelessWidget {
  final ViewMode viewMode;
  final ValueChanged<ViewMode> onChanged;

  const ScheduleViewSwitcher({super.key, required this.viewMode, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ToggleButtons(
        isSelected: [viewMode == ViewMode.week, viewMode == ViewMode.month],
        borderRadius: BorderRadius.circular(12),
        borderColor: AppColors.grey,
        selectedBorderColor: AppColors.backgroundPrimaryButton,
        selectedColor: AppColors.white,
        fillColor: AppColors.backgroundPrimaryButton,
        onPressed: (index) => onChanged(index == 0 ? ViewMode.week : ViewMode.month),
        children: const [
          Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: Text('Tuần', style: TextStyles.titleMedium)),
          Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: Text('Tháng', style: TextStyles.titleMedium)),
        ],
      ),
    );
  }
}