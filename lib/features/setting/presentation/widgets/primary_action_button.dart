import 'package:flutter/material.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/constants/border_radius.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:heroicons/heroicons.dart';

class PrimaryActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final HeroIcons? icon;
  final Color? backgroundColor;

  const PrimaryActionButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.icon,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: icon != null
            ? HeroIcon(icon!, color: AppColors.white)
            : const SizedBox.shrink(),
        label: Text(
          text,
          style: TextStyles.titleMedium.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.w900,
          ),
        ),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14),
          backgroundColor: backgroundColor ?? AppColors.backgroundPrimaryButton,
          shape: RoundedRectangleBorder(
            borderRadius: AppBorderRadius.radius12,
          ),
        ),
      ),
    );
  }
}