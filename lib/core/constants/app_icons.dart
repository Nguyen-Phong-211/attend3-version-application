import 'package:flutter/material.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppIcon {
  // Icon button login
  static const Icon iconSupport = Icon(Icons.help_outline, color: Colors.white, size: 20);
  // Icon button forgot password
  static const Icon iconForgotPassword = Icon(Icons.check, color: AppColors.white);
  // Icon button verify OTP
  static const Icon iconVerifyOTP = Icon(Icons.verified, color: Colors.white);
  // Icon filter
  static const Widget iconFilter = FaIcon(FontAwesomeIcons.filter, size: 12, color: AppColors.white);
  // Icon dropdown
  static const Widget iconDropdown = FaIcon(
    FontAwesomeIcons.circleChevronDown,
    size: 12,
    color: AppColors.primary,
  );
  // Icon dropdown item selected
  static const Widget iconDropdownItemSelected = FaIcon(
    FontAwesomeIcons.solidCircleDot,
    size: 10,
    color: AppColors.primary,
  );
  // Icon calendar
  static const Icon iconCalendar = Icon(Icons.calendar_month, color: AppColors.primary, size: 14,);
  // Icon chevron right
  static const Widget iconChevronRight = Icon(
    FontAwesomeIcons.chevronRight,
    color: AppColors.white,
    size: 11,
  );
  // Icon scaffold
  static const Widget iconScaffoldChevronLeft = FaIcon(FontAwesomeIcons.chevronLeft, color: Colors.white);
}