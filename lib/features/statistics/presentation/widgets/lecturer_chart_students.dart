import 'package:application/features/statistics/presentation/widgets/statistic_legend_item.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:application/core/theme/text_styles.dart';

class LecturerChartStudents extends StatelessWidget {
  final List<Map<String, dynamic>> data;

  const LecturerChartStudents({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return const Center(child: Text('Chưa có dữ liệu sinh viên.'));
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: data.length * 55,
        height: 280,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
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
                          reservedSize: 36,
                          getTitlesWidget: (value, _) {
                            final index = value.toInt();
                            if (index >= data.length) return const SizedBox.shrink();
                            if (index % 2 == 0) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: RotatedBox(
                                  quarterTurns: 1,
                                  child: Text(
                                    data[index]['name'] ?? '',
                                    style: const TextStyle(fontSize: 9),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              );
                            }
                            return const SizedBox();
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
      ),
    );
  }

  List<BarChartGroupData> _createBarGroups(List<Map<String, dynamic>> data) {
    return List.generate(data.length, (i) {
      final item = data[i];
      return BarChartGroupData(
        x: i,
        barsSpace: 3,
        barRods: [
          BarChartRodData(
            toY: (item['onTime'] ?? 0).toDouble(),
            color: Colors.green,
            width: 6,
          ),
          BarChartRodData(
            toY: (item['late'] ?? 0).toDouble(),
            color: Colors.amber,
            width: 6,
          ),
          BarChartRodData(
            toY: (item['absent'] ?? 0).toDouble(),
            color: Colors.redAccent,
            width: 6,
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