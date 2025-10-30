import 'package:flutter/material.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/features/widgets/scaffold_messages.dart';
import 'package:application/core/constants/app_label.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:application/core/constants/border_radius.dart';

class DetailLeaveRequestActionButton extends StatelessWidget {
  final String status;
  final String? approvalStatus;
  final TextEditingController reasonController;

  const DetailLeaveRequestActionButton({
    super.key,
    required this.status,
    required this.approvalStatus,
    required this.reasonController,
  });

  @override
  Widget build(BuildContext context) {
    if (status != 'pending') return const SizedBox.shrink();

    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        onPressed: () {
          if (approvalStatus == 'rejected' && reasonController.text.isEmpty) {
            ScaffoldMessages.informError(context, AppLabel.titleInformEnterReason);
            return;
          }
          Navigator.pop(context);
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
          backgroundColor: AppColors.backgroundPrimaryButton,
          shape: RoundedRectangleBorder(borderRadius: AppBorderRadius.radius14),
        ),
        child: const Text(AppLabel.titleButtonSubmit, style: TextStyles.titleButton),
      ),
    );
  }
}