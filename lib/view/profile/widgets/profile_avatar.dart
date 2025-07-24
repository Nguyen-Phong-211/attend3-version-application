import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:application/core/constants/app_colors_linear_gradient_constants.dart';

class ProfileAvatar extends StatelessWidget {
  final String name;
  final String email;

  const ProfileAvatar({
    super.key,
    required this.name,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 1),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: AppLinearGradient.linearGradient,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 45,
                backgroundColor: AppColors.white,
                child: const FaIcon(FontAwesomeIcons.user, color: AppColors.primary, size: 36),
              ),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.white,
                ),
                child: const Icon(Icons.camera_alt, size: 18, color: AppColors.primary),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            name,
            style: TextStyles.titleMedium.copyWith(color: AppColors.white),
          ),
          Text(
            email,
            style: TextStyles.bodyMedium.copyWith(color: AppColors.white),
          ),
        ],
      ),
    );
  }
}