import 'package:flutter/material.dart';
import 'barcode_card.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:application/core/constants/app_images.dart';
import 'package:application/core/constants/app_label.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

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
              // avatar user
              const CircleAvatar(
                backgroundImage: AssetImage(AppImages.avatarImageDefault),
                radius: 20,
              ),
              const SizedBox(width: 12),
              // welcome user and name user
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppLabel.titleWelcomeUser, style: TextStyles.bodySmall.copyWith(color: Colors.white)),
                    SizedBox(height: 2),
                    Text(
                      'Nguyễn Nguyễn Phong',
                      style: TextStyles.titleSmall.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
              // Statistic max_leave_days
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  AppLabel.titleMaxLeaveDays + ' 9',
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