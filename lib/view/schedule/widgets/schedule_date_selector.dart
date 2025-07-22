import 'package:application/core/constants/border_radius.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:application/core/constants/app_colors.dart';

class ScheduleDateSelector extends StatelessWidget {
  final List<DateTime> dates;
  final int selectedIndex;
  final ValueChanged<int> onDateSelected;

  const ScheduleDateSelector({super.key, required this.dates, required this.selectedIndex, required this.onDateSelected});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dates.length,
        itemBuilder: (context, index) {
          final date = dates[index];
          final isSelected = index == selectedIndex;
          final day = DateFormat.E('vi_VN').format(date);
          final num = date.day.toString();

          return GestureDetector(
            onTap: () => onDateSelected(index),
            child: Container(
              width: 60,
              margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.backgroundPrimaryButton : Colors.grey.shade200,
                borderRadius: AppBorderRadius.radius12,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(day, style: TextStyle(color: isSelected ? AppColors.white : AppColors.black)),
                  Text(num, style: TextStyle(fontWeight: FontWeight.w700, color: isSelected ? AppColors.white : AppColors.black)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}