import 'package:application/features/statistics/presentation/widgets/statistic_legend_item.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:application/core/theme/text_styles.dart';

class LecturerChartClasses extends StatelessWidget {
  final List<Map<String, dynamic>> data;

  const LecturerChartClasses({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 340,
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: _getMaxY(data),
                  barGroups: _createBarGroups(data),
                  barTouchData: BarTouchData(enabled: true),
                  gridData: const FlGridData(show: true),
                  borderData: FlBorderData(show: false),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 36,
                        getTitlesWidget: (value, _) => Text(
                          value.toInt().toString(),
                          style: TextStyles.bodySmall,
                        ),
                      ),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 36,
                        getTitlesWidget: (value, _) => Text(
                          value.toInt().toString(),
                          style: TextStyles.bodySmall,
                        ),
                      ),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, _) {
                          if (value.toInt() >= data.length) return const SizedBox();
                          return Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              data[value.toInt()]['label'] ?? '',
                              style: const TextStyle(fontSize: 11),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
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
      ),
    );
  }

  List<BarChartGroupData> _createBarGroups(List<Map<String, dynamic>> data) {
    return List.generate(data.length, (i) {
      final item = data[i];
      return BarChartGroupData(
        x: i,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
            toY: (item['onTime'] ?? 0).toDouble(),
            color: Colors.green,
            width: 8,
          ),
          BarChartRodData(
            toY: (item['late'] ?? 0).toDouble(),
            color: Colors.amber,
            width: 8,
          ),
          BarChartRodData(
            toY: (item['absent'] ?? 0).toDouble(),
            color: Colors.redAccent,
            width: 8,
          ),
        ],
      );
    });
  }

  double _getMaxY(List<Map<String, dynamic>> data) {
    double maxY = 0;
    for (var e in data) {
      final maxVal = [
        (e['onTime'] ?? 0),
        (e['late'] ?? 0),
        (e['absent'] ?? 0),
      ].reduce((a, b) => a > b ? a : b);
      if (maxVal > maxY) maxY = maxVal.toDouble();
    }
    return (maxY + 2).toDouble();
  }
}