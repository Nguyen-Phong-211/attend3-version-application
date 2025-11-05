import 'package:flutter/material.dart';
// auth module
import 'package:application/features/auth/presentation/screens/login_screen.dart';
import 'package:application/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:application/features/auth/presentation/screens/otp_verify_screen.dart';
import 'package:application/features/auth/presentation/screens/entry_password.dart';
// home module
import 'package:application/features/home/presentation/screen/home_screen.dart';
import 'package:application/features/home/presentation/screen/all_quick_access.dart';
// leave request module
import 'package:application/features/leave_request/presentation/screens/leave_screen.dart';
import 'package:application/view/approval_leave_quest/approval_leave_quest_screen.dart';
import 'package:application/features/leave_request/presentation/screens/leave_request_detail_screen.dart';
import 'package:application/features/leave_request/domain/entities/approval_leave_request_entity.dart';
// statistic module
import 'package:application/features/statistics/presentation/screen/statistic_student_screen.dart';


import 'package:application/view/schedule_studying/schedule_screen.dart';
import 'package:application/view/notification/notification_screen.dart';
import 'package:application/view/profile/profile_screen.dart';
import 'package:application/view/contact_lecturer/contact_lecturer_screen.dart';
import 'package:application/view/remind/remind_screen.dart';
import 'package:application/view/attendance/attendance_history_screen.dart';
import 'package:application/view/attendance/attendance_by_qrcode_screen.dart';
import 'package:application/view/general_setting/general_setting_screen.dart';
import 'package:application/view/term/term_screen.dart';
import 'package:application/view/feedback/feedback_screen.dart';
import 'app_routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // auth module
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case AppRoutes.otpVerify:
        return MaterialPageRoute(builder: (_) => const OtpVerifyScreen());
      case AppRoutes.forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case AppRoutes.resetPassword:
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());
      // home module
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case AppRoutes.allQuickAccess:
        return MaterialPageRoute(builder: (_) => const AllQuickAccessScreen());
      // leave request module
      case AppRoutes.leaveRequest:
        return MaterialPageRoute(builder: (_) => const LeaveScreen());
      case AppRoutes.approvalLeaveRequest:
        return MaterialPageRoute(builder: (_) => const ApprovalLeaveRequestScreen());
      case AppRoutes.detailLeaveRequest:
        final request = settings.arguments as ApprovalLeaveRequestEntity;
        return MaterialPageRoute(
          builder: (_) => ApprovedLeaveRequestDetailScreen(request: request),
        );
      // statistic module
      case AppRoutes.statisticStudent:
        return MaterialPageRoute(builder: (_) => const StatisticStudentScreen());


      case AppRoutes.schedule:
        return MaterialPageRoute(builder: (_) => const ScheduleScreen());
      case AppRoutes.notification:
        return MaterialPageRoute(builder: (_) => const NotificationScreen());
      case AppRoutes.profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case AppRoutes.contactLecturer:
        return MaterialPageRoute(builder: (_) => const ContactLecturerScreen());
      case AppRoutes.remind:
        return MaterialPageRoute(builder: (_) => const RemindScreen());


      case AppRoutes.attendanceHistory:
        return MaterialPageRoute(builder: (_) => const AttendanceHistoryScreen());
      case AppRoutes.scanCode:
        return MaterialPageRoute(builder: (_) => const AttendanceByQrcodeScreen());
      case AppRoutes.generalSetting:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case AppRoutes.term:
        return MaterialPageRoute(builder: (_) => const TermScreen());
      case AppRoutes.feedback:
        return MaterialPageRoute(builder: (_) => const FeedbackScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Không tìm thấy trang')),
          ),
        );
    }
  }
}
