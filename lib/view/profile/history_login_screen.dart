import 'package:flutter/material.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/constants/border_radius.dart';
import 'package:application/core/constants/box_shadow_constants.dart';
import 'package:application/core/constants/app_colors_linear_gradient_constants.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class HistoryLoginScreen extends StatelessWidget {
  final List<Map<String, dynamic>> loginHistory = [
    {
      'deviceName': 'iPhone 14 Pro Max',
      'deviceType': 'Mobile',
      'timestamp': DateTime.now().subtract(const Duration(hours: 1)),
    },
    {
      'deviceName': 'MacBook Air M2',
      'deviceType': 'Laptop',
      'timestamp': DateTime.now().subtract(const Duration(days: 1, hours: 3)),
    },
    {
      'deviceName': 'Samsung Galaxy S23',
      'deviceType': 'Mobile',
      'timestamp': DateTime.now().subtract(const Duration(days: 2)),
    },
  ];

  HistoryLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          // 👇 Custom Scaffold Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(16, 48, 16, 24),
            decoration: const BoxDecoration(
              gradient: AppLinearGradient.linearGradient,
              borderRadius: AppBorderRadius.borderRadiusBottomLeftRight24,
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const FaIcon(FontAwesomeIcons.chevronLeft, color: AppColors.white),
                ),
                const SizedBox(width: 12),
                Text('Lịch sử đăng nhập', style: TextStyles.titleScaffold),
              ],
            ),
          ),

          // 👇 Body content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ListView.builder(
                itemCount: loginHistory.length,
                itemBuilder: (context, index) {
                  return LoginHistoryCard(item: loginHistory[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LoginHistoryCard extends StatelessWidget {
  final Map<String, dynamic> item;

  const LoginHistoryCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final timeStr = DateFormat('dd/MM/yyyy HH:mm').format(item['timestamp']);

    return Container(
      height: 120,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(color: AppColors.primary, width: 6),
        ),
        borderRadius: AppBorderRadius.radius8,
        color: AppColors.white,
        boxShadow: CardShadows.cardShadowList,
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item['deviceName'], style: TextStyles.titleSmall),
          const SizedBox(height: 6),
          Row(
            children: [
              const Icon(Icons.devices, size: 16, color: AppColors.grey),
              const SizedBox(width: 6),
              Text(item['deviceType'], style: TextStyles.bodyNormal),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              const Icon(Icons.access_time, size: 16, color: AppColors.grey),
              const SizedBox(width: 6),
              Text(
                timeStr,
                style: const TextStyle(fontSize: 12, color: AppColors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}