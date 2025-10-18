import 'package:flutter/material.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/constants/border_radius.dart';
import 'package:application/core/constants/box_shadow_constants.dart';

class AppBoxDecoration {
  static const BoxDecoration boxDecorationPrimary = BoxDecoration(
    color: AppColors.white,
    borderRadius: AppBorderRadius.radius24,
    boxShadow: AppShadows.cardLoginShadowList,
  );
}