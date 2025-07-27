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

  static const TextStyle titleHeading = TextStyle(fontSize: 20, fontWeight: FontWeight.w900);
  static const TextStyle titleHeadingMedium = TextStyle(fontSize: 14, fontWeight: FontWeight.w900, color: AppColors.white);

  static const TextStyle titleScaffold = TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: AppColors.white);
  static const TextStyle titleInput = TextStyle(fontSize: 14, fontWeight: FontWeight.w700);

  static const TextStyle hintTextInput = TextStyle(fontSize: 13, fontWeight: FontWeight.normal);

  static const TextStyle titleMedium = TextStyle(fontSize: 13, fontWeight: FontWeight.w900);
  static const TextStyle titleSmall = TextStyle(fontSize: 11, fontWeight: FontWeight.w700);
  static const TextStyle bodyMedium = TextStyle(fontSize: 12, fontWeight: FontWeight.w700);
  static const TextStyle bodyNormal = TextStyle(fontSize: 10, fontWeight: FontWeight.normal);
  static const TextStyle bodySmall = TextStyle(fontSize: 10, fontWeight: FontWeight.w700);
  static const TextStyle bodySuperSmall = TextStyle(fontSize: 8, fontWeight: FontWeight.w700);

  static const TextStyle bodyNormal8 = TextStyle(fontSize: 8, fontWeight: FontWeight.normal);
}
