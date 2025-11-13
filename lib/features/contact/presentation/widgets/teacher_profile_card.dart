import 'package:flutter/material.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/constants/border_radius.dart';
import 'package:application/core/theme/text_styles.dart';

/// Display teacher's profile card with avatar, name, department, and email
class TeacherProfileCard extends StatelessWidget {
  final Map<String, String> profile;

  const TeacherProfileCard({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppBorderRadius.radius16,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 32,
            backgroundImage: NetworkImage(profile['avatar']!),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(profile['name']!, style: TextStyles.titleInput.copyWith(fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                Text(profile['department']!, style: TextStyles.hintTextInput),
                const SizedBox(height: 4),
                Text(profile['email']!, style: TextStyles.hintTextInput.copyWith(color: AppColors.primary)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}