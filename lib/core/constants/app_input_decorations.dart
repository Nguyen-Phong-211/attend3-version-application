import 'package:flutter/material.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/constants/border_radius.dart';

class AppInputDecorations {
  static InputDecoration base({
    String? hintText,
    Widget? prefixIcon,
    Widget? suffixIcon,
    String? errorText,
  }) {
    return InputDecoration(
      hintText: hintText,
      errorText: errorText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      enabledBorder: OutlineInputBorder(
        borderRadius: AppBorderRadius.radius12,
        borderSide: const BorderSide(color: Color(0xFFBDBDBD), width: 1.5),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: AppBorderRadius.radius12,
        borderSide: BorderSide(color: AppColors.inputFocus, width: 1.5),
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: AppBorderRadius.radius12,
        borderSide: BorderSide(color: Colors.red, width: 1.5),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderRadius: AppBorderRadius.radius12,
        borderSide: BorderSide(color: Colors.red, width: 1.5),
      ),
    );
  }
}