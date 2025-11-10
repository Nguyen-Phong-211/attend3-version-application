import 'package:flutter/material.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/constants/border_radius.dart';
import 'package:application/core/theme/text_styles.dart';

class GenderPicker extends StatelessWidget {
  final String gender;
  final ValueChanged<String> onChanged;
  const GenderPicker({super.key, required this.gender, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppBorderRadius.radius12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.transgender_rounded, color: AppColors.primary, size: 16),
              SizedBox(width: 8),
              Text("Giới tính", style: TextStyles.titleInput),
            ],
          ),
          Row(
            children: ['Nam', 'Nữ', 'Khác'].map((val) {
              return Expanded(
                child: RadioListTile<String>(
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  value: val,
                  groupValue: gender,
                  title: Text(val, style: TextStyles.hintTextInput),
                  activeColor: AppColors.primary,
                  onChanged: (v) => onChanged(v!),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}