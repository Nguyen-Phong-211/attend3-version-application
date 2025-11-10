import 'package:application/core/constants/app_colors.dart';
import 'package:application/view/notification/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:application/view/widgets/custom_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:application/core/constants/app_colors_linear_gradient_constants.dart';
import 'package:application/core/constants/border_radius.dart';
import 'package:application/view/attendance/attendance_by_qrcode_screen.dart';
import 'package:application/view/profile/update_profile.dart';
import 'package:application/view/leave/leave_screen.dart';
import 'package:application/view/contact_lecturer/contact_lecturer_screen.dart';
import 'package:application/view/schedule_studying/schedule_screen.dart';
import 'package:application/view/remind/remind_screen.dart';
import 'package:application/view/dashboard/dashboard_screen.dart';
import 'package:application/view/attendance/attendance_history_screen.dart';
import 'package:application/view/general_setting/general_setting_screen.dart';
import 'package:application/view/incident_report/incident_report_screen.dart';
import 'package:application/view/profile/change_language_screen.dart';
import 'package:application/view/term/term_screen.dart';

class AllQuickAccessScreen extends StatelessWidget {
  const AllQuickAccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(16, 48, 16, 24),
            decoration: const BoxDecoration(
              gradient: AppLinearGradient.linearGradient,
              borderRadius: AppBorderRadius.borderRadiusBottomLeftRight24,
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: FaIcon(FontAwesomeIcons.chevronLeft, color: AppColors.white,)
                ),
                const SizedBox(width: 12),
                Text(
                  'Tất cả truy cập nhanh',
                  style: TextStyles.titleScaffold
                ),
              ],
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.count(
                crossAxisCount: 3,
                childAspectRatio: 1,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  CustomButton(
                    label: 'QR Điểm danh',
                    iconPath: 'assets/icons/scan-code.png',
                    backgroundColor: Color(0xFFD1C4E9),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AttendanceByQrcodeScreen()
                        ),
                      );
                    },
                  ),
                  CustomButton(
                    label: 'Đăng ký khuôn mặt',
                    iconPath: 'assets/icons/face-scan.png',
                    backgroundColor: Color(0xFFFFCDD2),
                    onTap: () {},
                  ),
                  CustomButton(
                    label: 'Xin nghỉ phép',
                    iconPath: 'assets/icons/leave.png',
                    backgroundColor: Color(0xFFFFF9C4),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LeaveScreen()
                        ),
                      );
                    },
                  ),
                  CustomButton(
                    label: 'Liên hệ giảng viên',
                    iconPath: 'assets/icons/contact-us.png',
                    backgroundColor: Color(0xFFB2EBF2),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ContactLecturerScreen()
                        ),
                      );
                    },
                  ),
                  CustomButton(
                    label: 'Lịch học',
                    iconPath: 'assets/icons/calendar.png',
                    backgroundColor: Color(0xFFDCEDC8),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ScheduleScreen()
                        ),
                      );
                    },
                  ),
                  CustomButton(
                    label: 'Cập nhật thông tin',
                    iconPath: 'assets/icons/literature.png',
                    backgroundColor: Color(0xFFFFECB3),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UpdateProfileScreen()
                        ),
                      );
                    },
                  ),
                  CustomButton(
                    label: 'Nhắc nhở điểm danh',
                    iconPath: 'assets/icons/reminder-notes.png',
                    backgroundColor: Color(0xFFFFECB3),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RemindScreen()
                        ),
                      );
                    },
                  ),
                  CustomButton(
                    label: 'Thống kê điểm danh',
                    iconPath: 'assets/icons/statistics.png',
                    backgroundColor: Color(0xFFFFF3E0),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DashboardScreen()
                        ),
                      );
                    },
                  ),
                  CustomButton(
                    label: 'Thông báo',
                    iconPath: 'assets/icons/notification.png',
                    backgroundColor: Color(0xFFFFF3E0),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NotificationScreen()
                        ),
                      );
                    },
                  ),
                  CustomButton(
                    label: 'Chuyển đổi ngôn ngữ',
                    iconPath: 'assets/icons/translate.png',
                    backgroundColor: Color(0xFFE3F2FD),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LanguageSwitchScreen()
                        ),
                      );
                    },
                  ),
                  CustomButton(
                    label: 'Lịch sử điểm danh',
                    iconPath: 'assets/icons/history.png',
                    backgroundColor: Color(0xFFE1F5FE),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AttendanceHistoryScreen()
                        ),
                      );
                    },
                  ),
                  CustomButton(
                    label: 'Cài đặc chung',
                    iconPath: 'assets/icons/settings.png',
                    backgroundColor: Color(0xFFE0F7FA),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SettingsScreen1()
                        ),
                      );
                    },
                  ),
                  CustomButton(
                    label: 'Báo cáo sự cố',
                    iconPath: 'assets/icons/message.png',
                    backgroundColor: Color(0xFFFFEBEE),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const IncidentReportScreen()
                        ),
                      );
                    },
                  ),
                  CustomButton(
                    label: 'Hướng dẫn sử dụng',
                    iconPath: 'assets/icons/introduction.png',
                    backgroundColor: Color(0xFFF3E5F5),
                    onTap: () {},
                  ),
                  CustomButton(
                    label: 'Điều khoản',
                    iconPath: 'assets/icons/terms.png',
                    backgroundColor: Color(0xFFE8F5E9),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TermScreen()
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}