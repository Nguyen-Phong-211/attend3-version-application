import 'package:flutter/material.dart';
import 'package:application/core/constants/app_icons.dart';
import 'package:application/core/constants/app_label.dart';
import 'package:application/core/theme/text_styles.dart';

class SupportButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const SupportButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      icon: AppIcon.iconSupport,
      label: const Text(
        AppLabel.titleContactToSupport,
        style: TextStyles.styleButtonSupport,
      ),
      style: TextButton.styleFrom(
        backgroundColor: const Color(0xFF90CAF9),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    );
  }
}