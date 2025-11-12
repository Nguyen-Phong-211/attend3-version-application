import 'package:flutter/material.dart';
import 'app_routes.dart';
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

// schedule module
import 'package:application/features/schedule/presentation/screen/schedule_study_screen.dart';
import 'package:application/features/schedule/presentation/screen/schedule_teaching_screen.dart';
// setting module
import 'package:application/features/setting/presentation/screen/settings_screen.dart';
// notification module
import 'package:application/features/notification/presentation/screen/notification_screen.dart';

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
      // schedule module
      case AppRoutes.schedule:
        return MaterialPageRoute(builder: (_) => const ScheduleStudyScreen());
      case AppRoutes.scheduleTeaching:
        return MaterialPageRoute(builder: (_) => const ScheduleTeachingScreen());
      // setting module
      case AppRoutes.setting:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      // notification module
      case AppRoutes.notification:
        return MaterialPageRoute(builder: (_) => const NotificationScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Không tìm thấy trang')),
          ),
        );
    }
  }
}
