import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get_it/get_it.dart';
import 'package:application/providers/app_provider.dart';
import 'package:application/features/auth/presentation/providers/auth_provider.dart';
import 'package:application/features/home/presentation/providers/home_provider.dart';
import 'package:application/features/leave_request/presentation/provider/leave_request_provider.dart';
import 'package:application/features/statistics/presentation/provider/statistic_provider.dart';

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
      ],
      child: child,
    );
  }
}