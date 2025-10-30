import 'package:application/features/home/presentation/providers/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'app.dart';
import 'package:application/config/injection.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:application/providers/app_provider.dart';
import 'package:application/features/home/presentation/bloc/home_bloc.dart';
import 'package:application/features/auth/presentation/providers/auth_provider.dart';
import 'package:application/features/leave_request/presentation/provider/leave_request_provider.dart';

import 'features/leave_request/presentation/bloc/leave_request_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('vi_VN', null);
  // Initialize injection
  initAppInjection();

  runApp(
    MultiProvider(
      providers: [
        // App Provider
        ChangeNotifierProvider(create: (_) => AppProvider()),
        // Auth Provider
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        // Home Provider
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        // Leave Request Provider
        ChangeNotifierProvider(create: (_) => LeaveRequestProvider()),

        // Call Bloc
        BlocProvider<AuthBloc>(
          create: (_) => GetIt.instance<AuthBloc>(),
        ),

        BlocProvider<HomeBloc>(
          create: (_) => GetIt.instance<HomeBloc>(),
        ),

        BlocProvider<LeaveRequestBloc>(
          create: (_) => GetIt.instance<LeaveRequestBloc>(),
        ),

        BlocProvider<ApprovalBloc>(
          create: (_) => GetIt.instance<ApprovalBloc>(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}