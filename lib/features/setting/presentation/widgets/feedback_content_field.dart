import 'package:flutter/material.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/constants/box_shadow_constants.dart';
import 'package:application/core/theme/text_styles.dart';

class FeedbackContentField extends StatelessWidget {
  final TextEditingController controller;

  const FeedbackContentField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppShadows.cardShadowList,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Nội dung phản hồi', style: TextStyles.titleInput),
          const SizedBox(height: 8),
          TextField(
            controller: controller,
            maxLines: 6,
            decoration: InputDecoration(
              hintText: 'Nhập nội dung góp ý, đánh giá hoặc phản hồi của bạn...',
              hintStyle: TextStyles.hintTextInput,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.inputFocus, width: 1.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}