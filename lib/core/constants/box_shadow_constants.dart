import 'package:flutter/material.dart';

class CardShadows {
  static const BoxShadow cardShadow = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.08),
    offset: Offset(0, 2),
    blurRadius: 6,
    spreadRadius: 0,
  );

  static const List<BoxShadow> cardShadowList = [cardShadow];
}