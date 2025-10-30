import 'package:flutter/material.dart';

import 'package:application/core/constants/app_colors.dart';

class TextStyles {
  static const TextStyle headline = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
  );

  static const TextStyle body = TextStyle(
    fontSize: 16,
    color: Colors.black87,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 12,
    color: Colors.grey,
  );

  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static const TextStyle titleHeading = TextStyle(fontSize: 16, fontWeight: FontWeight.w900);
  static const TextStyle titleHeadingMedium = TextStyle(fontSize: 14, fontWeight: FontWeight.w900, color: AppColors.white);

  static const TextStyle titleScaffold = TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: AppColors.white);

  // Input field
  static const TextStyle titleInput = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w700,
  );

  // Value input field
  static const TextStyle titleValueInput = TextStyle(fontSize: 12, fontWeight: FontWeight.w500);

  // Value input field OTP
  static const TextStyle titleValueInputOTP = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

  // Button
  static const TextStyle styleButton = TextStyle(fontSize: 13, fontWeight: FontWeight.w900, color: AppColors.textPrimaryButton);

  // Button support when login
  static const TextStyle styleButtonSupport = TextStyle(fontSize: 10, fontWeight: FontWeight.w900, color: AppColors.textPrimaryButton);
  // Hint text input
  static const TextStyle hintTextInput = TextStyle(fontSize: 10, fontWeight: FontWeight.normal);

  static const TextStyle titleMedium = TextStyle(fontSize: 12, fontWeight: FontWeight.w900);
  static const TextStyle titleSmall = TextStyle(fontSize: 10, fontWeight: FontWeight.w700);
  static const TextStyle titleSuperSmall = TextStyle(fontSize: 7, fontWeight: FontWeight.w700);
  static const TextStyle titleSuperSmallItalic = TextStyle(fontSize: 7, fontWeight: FontWeight.w700, fontStyle: FontStyle.italic);
  static const TextStyle bodyMedium = TextStyle(fontSize: 11, fontWeight: FontWeight.w700);
  static const TextStyle bodyNormal = TextStyle(fontSize: 10, fontWeight: FontWeight.normal);
  static const TextStyle bodySmall = TextStyle(fontSize: 9, fontWeight: FontWeight.normal);
  static const TextStyle bodySuperSmall = TextStyle(fontSize: 8, fontWeight: FontWeight.w700);

  static const TextStyle bodyNormal8 = TextStyle(fontSize: 8, fontWeight: FontWeight.normal);
  static const TextStyle bodyNormalItalic8 = TextStyle(fontSize: 8, fontWeight: FontWeight.normal,fontStyle: FontStyle.italic);

  static const TextStyle bodyNormal9 = TextStyle(fontSize: 9, fontWeight: FontWeight.normal);
  // Title button
  static const TextStyle titleButton = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold
  );

  // Title card
  static const TextStyle titleCard = TextStyle(fontWeight: FontWeight.bold, fontSize: 11);
}
