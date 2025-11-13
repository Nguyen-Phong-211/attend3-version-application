import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/constants/border_radius.dart';
import 'package:application/core/constants/box_shadow_constants.dart';
import 'package:application/core/theme/text_styles.dart';

class QrPreviewWidget extends StatelessWidget {
  final String? qrData;
  final String? label;

  const QrPreviewWidget({super.key, this.qrData, this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppBorderRadius.radius12,
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: AppShadows.cardShadowList,
      ),
      child: qrData != null
          ? Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          QrImageView(
            data: qrData!,
            version: QrVersions.auto,
            size: 200.0,
          ),
          const SizedBox(height: 12),
          Text(
            label ?? '',
            style: TextStyles.titleInput.copyWith(color: AppColors.black),
          ),
        ],
      )
          : Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FaIcon(FontAwesomeIcons.qrcode, size: 80, color: Colors.grey.shade400),
          const SizedBox(height: 12),
          Text(
            'Chưa có mã QR — vui lòng nhập thông tin và bấm "Tạo QR Code"',
            textAlign: TextAlign.center,
            style: TextStyles.hintTextInput.copyWith(color: Colors.grey, fontSize: 10),
          ),
        ],
      ),
    );
  }
}