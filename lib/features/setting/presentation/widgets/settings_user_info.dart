import 'package:flutter/material.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/theme/text_styles.dart';

class SettingsUserInfo extends StatelessWidget {
  final Map<String, String> userInfo;

  const SettingsUserInfo({super.key, required this.userInfo});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: AppColors.primary.withValues(alpha: 0.1),
          child: const Icon(Icons.person, size: 40, color: AppColors.primary),
        ),
        const SizedBox(height: 12),
        Text(userInfo['name']!, style: TextStyles.titleMedium),
        const SizedBox(height: 4),
        Text(userInfo['email']!, style: TextStyles.bodyNormal),
      ],
    );
  }
}