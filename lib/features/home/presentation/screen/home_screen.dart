import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/features/home/presentation/bloc/home_bloc.dart';
import 'package:application/features/home/presentation/bloc/home_event.dart';
import 'package:application/features/home/presentation/bloc/home_state.dart';
import 'package:application/features/home/injection.dart';
import 'package:application/features/home/data/home_repository.dart';
import 'package:application/features/home/presentation/widgets/header_section.dart';
import 'package:application/features/home/presentation/widgets/quick_access_grid.dart';
import 'package:application/features/home/presentation/widgets/today_schedule.dart';
import 'package:application/features/widgets/bottom_nav_menu.dart';
import 'package:application/routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(locator<HomeRepository>())..add(LoadHomeData()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.white,
            body: Column(
              children: [
                HeaderSection(
                  userName: state.userName ?? '---', // TODO: Replace with real user name from API
                  maxLeaveDays: '9', // TODO: Replace with real value
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 15),
                        TodaySchedule(
                          schedules: state.todaySchedules ?? [], // data from BLoC
                        ),
                        const QuickAccessGrid(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            bottomNavigationBar: CustomBottomNavBar(
              currentIndex: 0,
              onTap: (index) {
                if (index == 0) {
                  Navigator.pushNamed(context, AppRoutes.home);
                } else if (index == 1) {
                  Navigator.pushNamed(context, AppRoutes.schedule);
                } else if (index == 3) {
                  Navigator.pushNamed(context, AppRoutes.notification);
                } else if (index == 4) {
                  Navigator.pushNamed(context, AppRoutes.profile);
                }
              },
            ),
          );
        },
      ),
    );
  }
}