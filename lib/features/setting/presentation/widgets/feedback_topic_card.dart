import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/constants/box_shadow_constants.dart';
import 'package:application/core/theme/text_styles.dart';

class FeedbackTopicCard extends StatelessWidget {
  final String selectedTopic;
  final List<String> topics;
  final ValueChanged<String> onTopicChanged;

  const FeedbackTopicCard({
    super.key,
    required this.selectedTopic,
    required this.topics,
    required this.onTopicChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Chủ đề phản hồi', style: TextStyles.titleMedium.copyWith(color: AppColors.black)),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: AppShadows.cardShadowList,
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            leading: CircleAvatar(
              backgroundColor: Colors.orange.withValues(alpha: 0.1),
              child: const Icon(Icons.feedback_outlined, color: Colors.orange),
            ),
            title: Text('Chủ đề', style: TextStyles.titleMedium),
            subtitle: Text(selectedTopic, style: TextStyles.bodySuperSmall.copyWith(fontWeight: FontWeight.normal)),
            trailing: DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                value: selectedTopic,
                items: topics
                    .map(
                      (item) => DropdownMenuItem<String>(
                    value: item,
                    child: Row(
                      children: [
                        const Icon(Icons.comment, size: 18, color: Colors.orange),
                        const SizedBox(width: 8),
                        Text(item, style: TextStyles.bodyNormal),
                      ],
                    ),
                  ),
                )
                    .toList(),
                onChanged: (value) {
                  if (value != null) onTopicChanged(value);
                },
                buttonStyleData: const ButtonStyleData(height: 50, padding: EdgeInsets.symmetric(horizontal: 12)),
                dropdownStyleData: DropdownStyleData(
                  maxHeight: 300,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}