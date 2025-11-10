import 'package:flutter/material.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:application/features/statistics/presentation/provider/statistic_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:application/features/widgets/loading_overlay.dart';
import 'package:application/features/statistics/presentation/widgets/statistic_student_header.dart';
import 'package:heroicons/heroicons.dart';
import 'package:application/features/statistics/presentation/widgets/lecturer_export_tab.dart';
import 'package:application/features/statistics/presentation/widgets/lecturer_dashboard_tab.dart';
import 'package:application/core/constants/app_label.dart';

class StatisticLecturerScreen extends StatefulWidget {
  const StatisticLecturerScreen({super.key});

  @override
  State<StatisticLecturerScreen> createState() =>
      _StatisticLecturerScreenState();
}

class _StatisticLecturerScreenState extends State<StatisticLecturerScreen> {
  @override
  void initState() {
    super.initState();
    final provider = context.read<StatisticProvider>();
    provider.loadDefaultClassStats();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<StatisticProvider>();

    return DefaultTabController(
      length: 2,
      child: LoadingOverlay(
        isLoading: provider.isLoading,
        child: Scaffold(
          backgroundColor: AppColors.white,
          body: Column(
            children: [
              const StatisticStudentHeader(),
              const TabBar(
                indicatorColor: AppColors.primary,
                labelColor: AppColors.primary,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(
                    icon: const HeroIcon(HeroIcons.chartBar, size: 17,),
                    child: const Text(AppLabel.titleTabDashboard, style: TextStyles.titleMedium),
                  ),
                  Tab(
                    icon: const HeroIcon(HeroIcons.arrowDownTray, size: 17),
                    child: const Text(AppLabel.titleTabExportFile, style: TextStyles.titleMedium),
                  ),
                ],
              ),

              Expanded(
                child: TabBarView(
                  children: [
                    /**************
                    * TAB 1
                    ***************/
                    const LecturerDashboardTab(),
                    /**************
                     * TAB 2
                     ***************/
                    const LecturerExportTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}