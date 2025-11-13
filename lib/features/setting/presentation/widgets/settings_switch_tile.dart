import 'package:flutter/material.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/theme/text_styles.dart';

class SettingsSwitchTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget? subtitle;
  final bool value;
  final void Function(bool)? onChanged;

  const SettingsSwitchTile({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    required this.value,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
      secondary: CircleAvatar(
        backgroundColor: AppColors.primary.withValues(alpha: 0.1),
        child: Icon(icon, color: AppColors.primary),
      ),
      title: Text(title, style: TextStyles.titleMedium),
      subtitle: subtitle,
      value: value,
      onChanged: onChanged,
      activeThumbColor: AppColors.primary,
    );
  }
}