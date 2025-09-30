import 'package:flutter/material.dart';
// import 'package:application/view/auth/login_screen.dart';
import 'package:application/features/auth/presentation/screens/login_screen.dart';
import 'package:application/view/home/home_screen.dart';
import 'package:application/view/schedule_studying/schedule_screen.dart';
import 'package:application/view/notification/notification_screen.dart';
import 'package:application/view/profile/profile_screen.dart';
import 'package:application/view/auth/forgot_password_screen.dart';
import 'package:application/view/auth/otp_verify_screen.dart';
import 'package:application/view/leave/leave_screen.dart';
import 'package:application/view/contact_lecturer/contact_lecturer_screen.dart';
import 'package:application/view/remind/remind_screen.dart';
import 'package:application/view/dashboard/dashboard_screen.dart';
import 'package:application/view/attendance/attendance_history_screen.dart';
import 'package:application/view/attendance/attendance_by_qrcode_screen.dart';
import 'package:application/view/general_setting/general_setting_screen.dart';
import 'package:application/view/home/all_quick_access.dart';
import 'package:application/view/term/term_screen.dart';
import 'package:application/view/feedback/feedback_screen.dart';
import 'package:application/view/approval_leave_quest/approval_leave_quest_screen.dart';
import 'app_routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case AppRoutes.schedule:
        return MaterialPageRoute(builder: (_) => const ScheduleScreen());
      case AppRoutes.notification:
        return MaterialPageRoute(builder: (_) => const NotificationScreen());
      case AppRoutes.profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case AppRoutes.forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case AppRoutes.otpVerify:
        return MaterialPageRoute(builder: (_) => const OtpVerifyScreen());
      case AppRoutes.leaveRequest:
        return MaterialPageRoute(builder: (_) => const LeaveScreen());
      case AppRoutes.contactLecturer:
        return MaterialPageRoute(builder: (_) => const ContactLecturerScreen());
      case AppRoutes.remind:
        return MaterialPageRoute(builder: (_) => const RemindScreen());
      case AppRoutes.dashboard:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      case AppRoutes.attendanceHistory:
        return MaterialPageRoute(builder: (_) => const AttendanceHistoryScreen());
      case AppRoutes.scanCode:
        return MaterialPageRoute(builder: (_) => const AttendanceByQrcodeScreen());
      case AppRoutes.generalSetting:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case AppRoutes.allQuickAccess:
        return MaterialPageRoute(builder: (_) => const AllQuickAccessScreen());
      case AppRoutes.term:
        return MaterialPageRoute(builder: (_) => const TermScreen());
      case AppRoutes.feedback:
        return MaterialPageRoute(builder: (_) => const FeedbackScreen());
      case AppRoutes.approvalLeaveResquest:
        return MaterialPageRoute(builder: (_) => const ApprovalLeaveRequestScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Không tìm thấy trang')),
          ),
        );
    }
  }
}
