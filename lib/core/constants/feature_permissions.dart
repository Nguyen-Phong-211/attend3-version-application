import 'package:flutter/material.dart';
import 'package:application/models/feature_permission.dart';
import 'package:application/view/attendance/attendance_by_qrcode_screen.dart';
import 'package:application/view/leave/leave_screen.dart';
import 'package:application/view/contact_lecturer/contact_lecturer_screen.dart';
// import 'package:application/view/schedule_studying/schedule_screen.dart';
// import 'package:application/view/profile/update_profile_screen.dart';
// import 'package:application/view/term/term_screen.dart';
// import 'package:application/view/remind/remind_screen.dart';
import 'package:application/view/dashboard/dashboard_screen.dart';
// import 'package:application/view/notification/notification_screen.dart';
import 'package:application/view/general_setting/general_setting_screen.dart';

import '../../features/setting/presentation/screen/settings_screen.dart';
// import 'package:application/view/incident_report/incident_report_screen.dart';
// import 'package:application/view/profile/change_language_screen.dart';

final List<FeaturePermission> allFeatures = [
  FeaturePermission(
    id: 'qr_attendance',
    label: 'QR Điểm danh',
    iconPath: 'assets/icons/scan-code.png',
    backgroundColor: const Color(0xFFD1C4E9),
    destination: (context) => const AttendanceByQrcodeScreen(),
    roles: ['student', 'lecturer'],
  ),
  FeaturePermission(
    id: 'leave_request',
    label: 'Xin nghỉ phép',
    iconPath: 'assets/icons/leave.png',
    backgroundColor: const Color(0xFFFFF9C4),
    destination: (context) => const LeaveScreen(),
    roles: ['student'],
  ),
  FeaturePermission(
    id: 'contact_lecturer',
    label: 'Liên hệ giảng viên',
    iconPath: 'assets/icons/contact-us.png',
    backgroundColor: const Color(0xFFB2EBF2),
    destination: (context) => const ContactLecturerScreen(),
    roles: ['student'],
  ),
  FeaturePermission(
    id: 'dashboard',
    label: 'Thống kê điểm danh',
    iconPath: 'assets/icons/statistics.png',
    backgroundColor: const Color(0xFFFFF3E0),
    destination: (context) => const DashboardScreen(),
    roles: ['admin', 'lecturer'],
  ),
  FeaturePermission(
    id: 'settings',
    label: 'Cài đặt chung',
    iconPath: 'assets/icons/settings.png',
    backgroundColor: const Color(0xFFE0F7FA),
    destination: (context) => const SettingsScreen(),
    roles: ['student', 'lecturer', 'admin'],
  ),
  // ... Add more
];