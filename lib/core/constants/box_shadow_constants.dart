import 'package:flutter/material.dart';

class AppShadows {

  // BoxShadow for card
  static const BoxShadow cardShadow = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.08),
    offset: Offset(0, 2),
    blurRadius: 6,
    spreadRadius: 0,
  );

  static const List<BoxShadow> cardShadowList = [cardShadow];

  // BoxShadow for card in login screen
  static const BoxShadow cardLoginShadow = BoxShadow(
    color: Colors.black12,
    blurRadius: 12,
    offset: Offset(0, 6),
  );

  static const List<BoxShadow> cardLoginShadowList = [cardLoginShadow];

  // BoxShadow for home screen to show barcode
  static const BoxShadow barcodeShadow = BoxShadow(
    color: const Color.fromRGBO(0, 0, 0, 0.08),
    offset: const Offset(0, 2),
    blurRadius: 6,
    spreadRadius: 0,
  );

  static const List<BoxShadow> barcodeShadowList = [barcodeShadow];

  // BoxShadow for input field
  static const BoxShadow inputShadow = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.05), // Colors.black.withValues(alpha: 0.05),
    blurRadius: 6,
    offset: const Offset(0, 2),
  );

  static const List<BoxShadow> inputShadowList = [inputShadow];

  //
  static const BoxShadow dropdownItemShadow = BoxShadow(
    color: Color.fromRGBO(158, 158, 158, 0.15), // Colors.grey.withValues(alpha: 0.15),
    blurRadius: 6,
    offset: const Offset(0, 3),
  );

  static const List<BoxShadow> dropdownItemShadowList = [dropdownItemShadow];

  // Card shadow
  static const BoxShadow cardShadowGeneral = BoxShadow(
      color: Color.fromRGBO(158, 158, 158, 0.15), // Colors.grey.shade200,
      blurRadius: 6,
      offset: const Offset(0, 2)
  );

  static const List<BoxShadow> cardShadowGeneralList = [cardShadowGeneral];
}