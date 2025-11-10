import 'package:flutter/material.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/constants/border_radius.dart';
import 'package:application/core/constants/box_shadow_constants.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:heroicons/heroicons.dart';
import 'package:intl/intl.dart';
import 'package:application/features/setting/domain/entities/login_history_entity.dart';

class LoginHistoryCard extends StatelessWidget {
  final LoginHistoryEntity item;
  const LoginHistoryCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final loginTime = DateFormat('dd/MM/yyyy HH:mm').format(item.loginTime);
    final logoutTime = DateFormat('dd/MM/yyyy HH:mm').format(item.logoutTime);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppBorderRadius.radius12,
        border: Border(
          left: BorderSide(color: AppColors.primary, width: 6),
        ),
        boxShadow: AppShadows.cardShadowList,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item.deviceName, style: TextStyles.titleSmall),
          const SizedBox(height: 4),
          Row(
            children: [
              const HeroIcon(HeroIcons.devicePhoneMobile, color: AppColors.grey, size: 15),
              const SizedBox(width: 6),
              Text(item.deviceType, style: TextStyles.bodyNormal),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const HeroIcon(HeroIcons.wifi, color: AppColors.grey, size: 15),
              const SizedBox(width: 6),
              Text(item.ipAddress, style: TextStyles.bodyNormal),
              const SizedBox(width: 12),
              const HeroIcon(HeroIcons.mapPin, color: AppColors.grey, size: 15),
              const SizedBox(width: 4),
              Expanded(
                child: Text(item.location, style: TextStyles.bodyNormal, overflow: TextOverflow.ellipsis),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              const HeroIcon(HeroIcons.arrowRightStartOnRectangle, color: AppColors.grey, size: 15),
              const SizedBox(width: 6),
              Expanded(child: Text('Đăng nhập: $loginTime', style: TextStyles.bodyNormal)),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const HeroIcon(HeroIcons.arrowLeftStartOnRectangle, color: AppColors.grey, size: 15),
              const SizedBox(width: 6),
              Expanded(child: Text('Đăng xuất: $logoutTime', style: TextStyles.bodyNormal)),
            ],
          ),
        ],
      ),
    );
  }
}