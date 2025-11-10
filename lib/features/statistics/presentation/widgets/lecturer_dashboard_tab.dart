import 'package:flutter/material.dart';
import 'package:application/core/constants/app_images.dart';
import 'package:application/core/constants/app_label.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:application/features/statistics/presentation/widgets/lecturer_summary_card.dart';
import 'package:application/features/statistics/presentation/widgets/lecturer_filter_section.dart';
import 'package:application/features/statistics/presentation/widgets/lecturer_chart_students.dart';
import 'package:application/features/statistics/presentation/widgets/lecturer_chart_classes.dart';
import 'package:application/features/statistics/presentation/provider/statistic_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LecturerDashboardTab extends StatelessWidget {
  const LecturerDashboardTab({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<StatisticProvider>();

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 16),
          LecturerSummaryCard(summary: provider.summary),
          const SizedBox(height: 16),

          LecturerFilterSection(
            onFilter: (className, subject, range) {
              provider.applyFilter(className, subject, range);
            },
          ),
          const SizedBox(height: 16),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: const Text(
              "Thống kê theo lớp và môn học",
              style: TextStyles.titleSmall,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 240,
            child: LecturerChartClasses(data: provider.classStats),
          ),
          const SizedBox(height: 24),

          if (!provider.hasData)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    AppImages.imageIconEmptyData,
                    width: 60,
                    height: 60,
                    color: Colors.grey.shade400,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    AppLabel.titleReturnEmptyData,
                    style: TextStyles.titleSmall.copyWith(
                      color: Colors.grey.shade400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
          else ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: const Text(
                "Thống kê điểm danh sinh viên",
                style: TextStyles.titleSmall,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 240,
              child: LecturerChartStudents(data: provider.studentStats),
            ),
            const SizedBox(height: 24),
          ],
        ],
      ),
    );
  }
}