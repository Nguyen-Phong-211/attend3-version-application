import 'package:flutter/material.dart';
import 'package:application/view/auth/login_screen.dart';
import 'package:application/view/home/home_screen.dart';
import 'package:application/view/schedule/schedule_screen.dart';
import 'package:application/view/notification/notification_screen.dart';
import 'package:application/view/profile/profile_screen.dart';
import 'package:application/view/auth/forgot_password_screen.dart';
import 'package:application/view/auth/otp_verify_screen.dart';
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
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Không tìm thấy trang')),
          ),
        );
    }
  }
}
