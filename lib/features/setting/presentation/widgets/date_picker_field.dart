import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/constants/border_radius.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:application/core/constants/app_images.dart';

class DatePickerField extends StatelessWidget {
  final DateTime? birthDate;
  final ValueChanged<DateTime> onDateSelected;

  const DatePickerField({super.key, this.birthDate, required this.onDateSelected});

  Future<void> _openDatePicker(BuildContext context) async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 80);
    final lastDate = now;
    DateTime tempDate = birthDate ?? now;
    if (tempDate.isBefore(firstDate)) tempDate = firstDate;
    if (tempDate.isAfter(lastDate)) tempDate = lastDate;

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
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Header
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
                        Text(DateFormat('yyyy').format(tempDate), style: const TextStyle(color: Colors.white70, fontSize: 16)),
                        const SizedBox(height: 4),
                        Text(DateFormat('EEE, MMM dd', 'vi_VN').format(tempDate),
                            style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        Text('Chọn ngày sinh của bạn', style: TextStyles.hintTextInput.copyWith(color: AppColors.white)),
                      ],
                    ),
                  ),
                  CalendarDatePicker(
                    initialDate: tempDate,
                    firstDate: firstDate,
                    lastDate: lastDate,
                    onDateChanged: (value) => setState(() => tempDate = value),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Expanded(child: TextButton(onPressed: () => Navigator.pop(context), child: const Text('Hủy', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)))),
                        Expanded(child: TextButton(onPressed: () => Navigator.pop(context, tempDate), child: const Text('Xác nhận', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)))),
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

    if (picked != null) onDateSelected(picked);
  }

  @override
  Widget build(BuildContext context) {
    final birthText = birthDate != null ? DateFormat('dd/MM/yyyy').format(birthDate!) : 'Chọn ngày sinh';
    return GestureDetector(
      onTap: () => _openDatePicker(context),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: AppBorderRadius.radius12,
          border: Border.all(color: birthDate != null ? AppColors.inputFocus : Colors.grey.shade300, width: 1.5),
        ),
        child: Row(
          children: [
            const Icon(Icons.date_range, color: AppColors.primary, size: 16),
            const SizedBox(width: 12),
            Text(birthText, style: TextStyles.hintTextInput,),
            const Spacer(),
            const FaIcon(FontAwesomeIcons.circleChevronDown, size: 12, color: AppColors.primary),
          ],
        ),
      ),
    );
  }
}