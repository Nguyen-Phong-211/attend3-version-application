import 'package:flutter/material.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:application/core/constants/app_images.dart';
import 'package:application/core/constants/app_label.dart';
import 'package:application/core/constants/border_radius.dart';
import 'barcode_card.dart';

class HeaderSection extends StatelessWidget {
  final String userName;
  final String maxLeaveDays;

  const HeaderSection({
    super.key,
    required this.userName,
    required this.maxLeaveDays,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 24),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF00B4DB), Color(0xFF0083B0)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage(AppImages.avatarImageDefault),
                radius: 20,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppLabel.titleWelcomeUser,
                        style: TextStyles.bodySmall.copyWith(color: Colors.white)),
                    const SizedBox(height: 2),
                    Text(
                      userName, // dynamic from API
                      style: TextStyles.titleSmall.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: AppBorderRadius.radius30,
                ),
                child: Text(
                  '${AppLabel.titleMaxLeaveDays} $maxLeaveDays', // dynamic
                  style: TextStyles.titleSmall.copyWith(color: Colors.black),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const BarcodeCard(),
        ],
      ),
    );
  }
}