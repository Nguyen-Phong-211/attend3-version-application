import 'package:application/features/setting/presentation/bloc/login_history_bloc.dart';
import 'package:application/features/setting/presentation/bloc/settings_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:application/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:application/features/home/presentation/bloc/home_bloc.dart';
import 'package:application/features/leave_request/presentation/bloc/leave_request_bloc.dart';
import 'package:application/features/statistics/presentation/bloc/statistic_bloc.dart';
import 'package:application/features/schedule/presentation/bloc/schedule_bloc.dart';
import 'package:application/features/schedule/presentation/bloc/schedule_teaching_bloc.dart';
import 'package:application/features/setting/presentation/bloc/settings_bloc.dart';
import 'package:application/features/attendance/presentation/bloc/create_qrcode_bloc.dart';
import 'package:application/features/contact/presentation/bloc/contact_bloc.dart';

class AppBlocs extends StatelessWidget {
  final Widget child;
  const AppBlocs({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GetIt.instance<AuthBloc>()),
        BlocProvider(create: (_) => GetIt.instance<HomeBloc>()),
        BlocProvider(create: (_) => GetIt.instance<LeaveRequestBloc>()),
        BlocProvider(create: (_) => GetIt.instance<StatisticBloc>()),
        BlocProvider(create: (_) => GetIt.instance<ApprovalBloc>()),
        BlocProvider(create: (_) => GetIt.instance<ScheduleBloc>()),
        BlocProvider(create: (_) => GetIt.instance<ScheduleTeachingBloc>()),
        BlocProvider(create: (_) => GetIt.instance<SettingBloc>()..add(LoadSettingEvent())),
        BlocProvider(create: (_) => GetIt.instance<LoginHistoryBloc>()),
        BlocProvider(create: (_) => GetIt.instance<CreateQrCodeBloc>()),
        BlocProvider(create: (_) => GetIt.instance<ContactBloc>()),
      ],
      child: child,
    );
  }
}