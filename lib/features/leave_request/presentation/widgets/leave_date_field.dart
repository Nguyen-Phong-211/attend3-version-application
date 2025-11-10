import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/constants/border_radius.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:application/core/constants/app_images.dart';
import 'package:application/core/constants/app_label.dart';

class LeaveDateField extends StatelessWidget {
  final String hint;
  final DateTime? date;
  final ValueChanged<DateTime> onDateSelected;

  const LeaveDateField({
    super.key,
    required this.hint,
    required this.date,
    required this.onDateSelected,
  });

  Future<void> _openDatePicker(BuildContext context) async {
    final now = DateTime.now();
    DateTime tempDate = date ?? now;

    final picked = await showModalBottomSheet<DateTime>(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black54,
      builder: (_) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              margin: const EdgeInsets.only(top: 60),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.black.withValues(alpha: 0.2),
                //     blurRadius: 20,
                //     offset: const Offset(0, -4),
                //   ),
                // ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // HEADER displays the selected date
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage(AppImages.imageBackgroundDateField),
                        fit: BoxFit.cover,
                      ),
                      gradient: LinearGradient(
                        colors: [
                          AppColors.primary.withValues(alpha: 0.95),
                          AppColors.primary.withValues(alpha: 0.75),
                        ],
                      ),
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          DateFormat('yyyy').format(tempDate),
                          style: const TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          DateFormat('EEE, MMM dd', 'vi_VN').format(tempDate),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          AppLabel.titleDateField,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // CALENDAR
                  CalendarDatePicker(
                    initialDate: tempDate,
                    firstDate: DateTime(now.year - 1),
                    lastDate: DateTime(now.year + 2),
                    onDateChanged: (value) => setState(() => tempDate = value),
                  ),

                  const Divider(height: 1),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text(
                              AppLabel.titleButtonCancel,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextButton(
                            onPressed: () => Navigator.pop(context, tempDate),
                            child: const Text(
                              AppLabel.titleButtonOK,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary,
                                // backgroundColor: Color(00)
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );

    if (picked != null) {
      onDateSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final displayText =
    date != null ? DateFormat('dd/MM/yyyy').format(date!) : hint;

    return GestureDetector(
      onTap: () => _openDatePicker(context),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: AppBorderRadius.radius12,
          border: Border.all(
            color: date != null ? AppColors.inputFocus : Colors.grey.shade300, //const Color(0xFFBDBDBD),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        child: Row(
          children: [
            const Icon(Icons.date_range, color: AppColors.primary, size: 12),
            const SizedBox(width: 12),
            Text(
              displayText,
              style: TextStyles.hintTextInput.copyWith(
                color: date != null ? AppColors.black : Colors.grey,
              ),
            ),
            const Spacer(),
            const FaIcon(FontAwesomeIcons.circleChevronDown, size: 12, color: AppColors.primary),
          ],
        ),
      ),
    );
  }
}