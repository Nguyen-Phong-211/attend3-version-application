import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:application/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:application/features/home/presentation/bloc/home_bloc.dart';
import 'package:application/features/leave_request/presentation/bloc/leave_request_bloc.dart';
import 'package:application/features/statistics/presentation/bloc/statistic_bloc.dart';

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
      ],
      child: child,
    );
  }
}