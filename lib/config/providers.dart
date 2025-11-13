import 'package:application/features/schedule/domain/usecases/get_schedule_teaching_usecase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get_it/get_it.dart';
import 'package:application/providers/app_provider.dart';
import 'package:application/features/auth/presentation/providers/auth_provider.dart';
import 'package:application/features/home/presentation/providers/home_provider.dart';
import 'package:application/features/leave_request/presentation/provider/leave_request_provider.dart';
import 'package:application/features/statistics/presentation/provider/statistic_provider.dart';
import 'package:application/features/schedule/presentation/provider/schedule_provider.dart';
import 'package:application/features/schedule/domain/usecases/get_schedule_usecase.dart';
import 'package:application/features/schedule/presentation/provider/schedule_teaching_provider.dart';
import 'package:application/features/setting/presentation/provider/setting_provider.dart';
import 'package:application/features/setting/domain/usecases/get_settings_usecase.dart';
import 'package:application/features/setting/domain/usecases/update_settings_usecase.dart';
import 'package:application/features/setting/presentation/provider/login_history_provider.dart';
import 'package:application/features/attendance/presentation/provider/create_qrcode_provider.dart';
import 'package:application/features/contact/presentation/provider/contact_provider.dart';

class AppProviders extends StatelessWidget {
  final Widget child;
  const AppProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => LeaveRequestProvider()),
        // TODO: Don't need
        // ChangeNotifierProvider(create: (_) => ApprovalProvider()),
        ChangeNotifierProvider(
          create: (_) => GetIt.instance<StatisticProvider>(),
        ),
        /// Schedule
        ChangeNotifierProvider(
          create: (_) => ScheduleProvider(
            getScheduleUseCase: GetIt.instance<GetScheduleUseCase>(),
          ),
        ),
        /// Teaching Schedule
        ChangeNotifierProvider(
          create: (_) => ScheduleTeachingProvider(
            getScheduleTeachingUseCase: GetIt.instance<GetScheduleTeachingUseCase>(),
          ),
        ),
        /// Setting
        ChangeNotifierProvider(
          create: (_) => SettingProvider(
            getSettingsUseCase: GetIt.instance<GetSettingsUseCase>(),
            updateSettingsUseCase: GetIt.instance<UpdateSettingsUseCase>(),
          )..loadSettings(),
        ),
        /// Login history
        ChangeNotifierProvider(
          create: (_) => GetIt.instance<LoginHistoryProvider>(),
        ),
        /// Create QRCode
        ChangeNotifierProvider(
            create: (_) => GetIt.instance<CreateQrCodeProvider>(),
        ),
        /// Contact
        ChangeNotifierProvider(
            create: (_) => GetIt.instance<ContactProvider>(),
        ),
      ],
      child: child,
    );
  }
}