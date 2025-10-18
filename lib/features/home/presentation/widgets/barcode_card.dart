import 'package:flutter/material.dart';
import 'package:application/core/constants/app_label.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:application/core/constants/box_shadow_constants.dart';

class BarcodeCard extends StatelessWidget {
  const BarcodeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: AppShadows.barcodeShadowList,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            AppLabel.titleNote,
            textAlign: TextAlign.center,
            style: TextStyles.titleSmall,
          ),
          const SizedBox(height: 12),
          // TODO: Replace this local image with QR code image from API
          Center(child: Image.asset('assets/images/barcode.jpg', height: 50)),
          const SizedBox(height: 4),
          const Text(
            '21070601',
            style: TextStyles.titleSmall,
          ),
        ],
      ),
    );
  }
}