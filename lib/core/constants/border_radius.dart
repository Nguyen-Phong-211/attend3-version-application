import 'package:flutter/material.dart';

class AppBorderRadius {
  static const BorderRadius radius8 = BorderRadius.all(Radius.circular(8));
  static const BorderRadius radius12 = BorderRadius.all(Radius.circular(12));
  static const BorderRadius radius14 = BorderRadius.all(Radius.circular(14));
  static const BorderRadius radius16 = BorderRadius.all(Radius.circular(16));
  static const BorderRadius radius18 = BorderRadius.all(Radius.circular(18));
  static const BorderRadius radius20 = BorderRadius.all(Radius.circular(20));
  static const BorderRadius radius22 = BorderRadius.all(Radius.circular(22));
  static const BorderRadius radius24 = BorderRadius.all(Radius.circular(24));

  static const BorderRadius top24 = BorderRadius.vertical(top: Radius.circular(24));
  static const BorderRadius bottom24 = BorderRadius.vertical(bottom: Radius.circular(24));

  static const BorderRadius borderRadiusBottomLeftRight24 = BorderRadius.only(
    bottomLeft: Radius.circular(24),
    bottomRight: Radius.circular(24),
  );
}
