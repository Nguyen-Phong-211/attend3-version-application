import 'package:flutter/material.dart';
import 'package:application/features/widgets/input_fields.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:application/core/constants/border_radius.dart';
import 'package:application/core/constants/app_label.dart';

class DetailLeaveRequestApprovalForm extends StatelessWidget {
  final String? approvalStatus;
  final TextEditingController reasonController;
  final ValueChanged<String?> onChanged;

  const DetailLeaveRequestApprovalForm({
    super.key,
    required this.approvalStatus,
    required this.reasonController,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Xác nhận duyệt đơn', style: TextStyles.bodyMedium),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InputFields.customRadio(
              label: 'Duyệt',
              value: 'approved',
              groupValue: approvalStatus,
              activeColor: AppColors.backgroundPrimaryButton,
              onChanged: onChanged,
              labelStyle: TextStyles.titleInput,
            ),
            InputFields.customRadio(
              label: 'Từ chối',
              value: 'rejected',
              groupValue: approvalStatus,
              activeColor: Colors.redAccent,
              onChanged: onChanged,
              labelStyle: TextStyles.titleInput,
            ),
          ],
        ),
        if (approvalStatus == 'rejected') ...[
          const SizedBox(height: 8),
          TextField(
            controller: reasonController,
            decoration: InputDecoration(
              hintText: AppLabel.hintTextInputReason,
              hintStyle: TextStyles.hintTextInput.copyWith(color: Colors.grey),
              prefixIcon: const Icon(Icons.edit_note_rounded, color: AppColors.primary, size: 16),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.all(16),
              enabledBorder: OutlineInputBorder(
                borderRadius: AppBorderRadius.radius12,
                borderSide: const BorderSide(color: Color(0xFFE0E0E0), width: 1.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: AppBorderRadius.radius12,
                borderSide: const BorderSide(color: AppColors.inputFocus, width: 1.5),
              ),
            ),
            maxLines: 5,
          )
        ],
      ],
    );
  }
}