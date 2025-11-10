import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:application/features/statistics/injection.dart';
import 'package:application/features/statistics/presentation/provider/statistic_provider.dart';
import 'package:application/features/statistics/presentation/widgets/statistic_student_header.dart';
import 'package:application/features/statistics/presentation/widgets/statistic_student_summary_cards.dart';
import 'package:application/features/statistics/presentation/widgets/statistic_student_chart.dart';
import 'package:application/features/statistics/presentation/widgets/statistic_student_remaining_list.dart';
import 'package:application/features/widgets/loading_overlay.dart';
import 'package:application/core/constants/app_label.dart';

class StatisticStudentScreen extends StatefulWidget {
  const StatisticStudentScreen({Key? key}) : super(key: key);

  @override
  State<StatisticStudentScreen> createState() => _StatisticStudentScreenState();
}

class _StatisticStudentScreenState extends State<StatisticStudentScreen> {

  @override
  void initState() {
    super.initState();
    final provider = locator<StatisticProvider>();
    provider.fetchStatistics();
  }

  @override
  Widget build(BuildContext context) {
    final statisticProvider = locator<StatisticProvider>();

    return ChangeNotifierProvider.value(
      value: statisticProvider,
      child: Consumer<StatisticProvider>(
        builder: (context, provider, _) {
          final dayOffBySubject = provider.dayOffBySubject;
          final absentCount = provider.absentCount;
          final lateCount = provider.lateCount;
          final onTimeCount = provider.onTimeCount;

          return LoadingOverlay(
              isLoading: provider.isLoading,
              child: Scaffold(
                backgroundColor: AppColors.white,
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const StatisticStudentHeader(),
                      const SizedBox(height: 24),
                      StatisticStudentSummaryCards(
                        absentCount: absentCount,
                        lateCount: lateCount,
                        onTimeCount: onTimeCount,
                      ),
                      const SizedBox(height: 24),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: const Text(
                          AppLabel.titleBarChart,
                          style: TextStyles.titleMedium,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const StatisticStudentChart(),
                      const SizedBox(height: 24),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: const Text(
                          AppLabel.titleTableDataStatistic,
                          style: TextStyles.titleMedium,
                        ),
                      ),
                      const SizedBox(height: 8),
                      StatisticStudentRemainingList(
                          dayOffBySubject: dayOffBySubject),
                    ],
                  ),
                )
              )
          );
        },
      ),
    );
  }
}