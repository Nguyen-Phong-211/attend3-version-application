import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/theme/text_styles.dart';
import 'statistic_legend_item.dart';

class StatisticStudentChart extends StatelessWidget {
  const StatisticStudentChart({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Replace fake data with API data later
    final subjects = ['Toán', 'Lý', 'Hóa', 'Tin', 'Anh'];
    final attendanceData = {
      'Toán': [8, 1, 0],
      'Lý': [7, 2, 1],
      'Hóa': [9, 0, 0],
      'Tin': [6, 3, 1],
      'Anh': [7, 1, 0],
    };

    const maxY = 10.0;

    return Column(
      children: [
        SizedBox(
          height: 260,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: maxY,
                barTouchData: BarTouchData(enabled: false),
                gridData: FlGridData(
                  show: true,
                  drawHorizontalLine: true,
                  horizontalInterval: 2,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: AppColors.grey.withValues(alpha: 0.3),
                    strokeWidth: 1,
                  ),
                ),
                borderData: FlBorderData(show: false),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 2,
                      getTitlesWidget: (value, _) =>
                          Text(value.toInt().toString(),
                              style: TextStyles.bodySmall),
                      reservedSize: 28,
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, _) {
                        if (value.toInt() < subjects.length) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(subjects[value.toInt()],
                                style: TextStyles.bodySmall),
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                barGroups: List.generate(subjects.length, (i) {
                  final data = attendanceData[subjects[i]]!;
                  return BarChartGroupData(
                    x: i,
                    barsSpace: 4,
                    barRods: [
                      BarChartRodData(
                          toY: data[0].toDouble(),
                          color: Colors.green,
                          width: 8),
                      BarChartRodData(
                          toY: data[1].toDouble(),
                          color: Colors.amber,
                          width: 8),
                      BarChartRodData(
                          toY: data[2].toDouble(),
                          color: Colors.redAccent,
                          width: 8),
                    ],
                  );
                }),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StatisticLegendItem(color: Colors.green, label: 'Đúng giờ'),
            SizedBox(width: 16),
            StatisticLegendItem(color: Colors.amber, label: 'Trễ'),
            SizedBox(width: 16),
            StatisticLegendItem(color: Colors.redAccent, label: 'Vắng mặt'),
          ],
        ),
      ],
    );
  }
}