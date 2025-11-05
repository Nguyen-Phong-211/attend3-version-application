import 'package:flutter/material.dart';
import 'package:application/routes/app_routes.dart';
import 'package:application/view/widgets/bottom_nav_menu.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:application/core/constants/app_colors_linear_gradient_constants.dart';
import 'package:application/core/constants/border_radius.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum FilterOption { week, month }

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  FilterOption _selectedFilter = FilterOption.week;

  final Map<String, int> dayOffBySubject = {
    'Toán': 2,
    'Lý': 1,
    'Hóa': 0,
    'Tin': 3,
    'Anh': 1,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(16, 48, 16, 24),
            decoration: const BoxDecoration(
              gradient: AppLinearGradient.linearGradient,
              borderRadius: AppBorderRadius.borderRadiusBottomLeftRight24,
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: FaIcon(FontAwesomeIcons.chevronLeft, color: AppColors.white),
                ),
                const SizedBox(width: 12),
                Text('Thống kê điểm danh', style: TextStyles.titleScaffold),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Tiêu đề biểu đồ
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Thống kê số ngày nghỉ',
              style: TextStyles.titleMedium,
            ),
          ),
          const SizedBox(height: 12),

          // Bộ lọc tuần / tháng
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: _buildHeader(),
          ),

          const SizedBox(height: 12),
          _buildChart(),

          const SizedBox(height: 24),

          // Tiêu đề danh sách
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Số ngày nghỉ còn lại theo môn học',
              style: TextStyles.titleMedium,
            ),
          ),

          const SizedBox(height: 8),
          _buildRemainingDayOffList(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 2,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, AppRoutes.home);
              break;
            case 1:
              Navigator.pushNamed(context, AppRoutes.schedule);
              break;
            case 3:
              Navigator.pushNamed(context, AppRoutes.notification);
              break;
            case 4:
              Navigator.pushNamed(context, AppRoutes.profile);
              break;
          }
        },
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: FilterOption.values.map((option) {
        final isSelected = _selectedFilter == option;
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: ElevatedButton(
              onPressed: () {
                setState(() => _selectedFilter = option);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: isSelected ? AppColors.primary : Colors.grey.shade200,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: Text(
                option == FilterOption.week ? 'Tuần này' : 'Tháng này',
                style: isSelected
                    ? TextStyles.titleMedium.copyWith(color: AppColors.white)
                    : TextStyles.titleMedium.copyWith(color: AppColors.black),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildChart() {
    final data = _selectedFilter == FilterOption.week
        ? [1, 0, 2, 0, 1, 0, 1]
        : [3, 2, 0, 4];

    return SizedBox(
      height: 200,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceAround,
            maxY: 5,
            barTouchData: BarTouchData(enabled: false),
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, _) {
                    return Text(
                      value.toInt().toString(),
                      style: TextStyles.bodySmall,
                    );
                  },
                  interval: 1,
                  reservedSize: 28,
                ),
              ),
              rightTitles: AxisTitles(), // vẫn ẩn
              topTitles: AxisTitles(),   // vẫn ẩn
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, _) {
                    final labels = _selectedFilter == FilterOption.week
                        ? ['T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'CN']
                        : ['Tuần 1', 'Tuần 2', 'Tuần 3', 'Tuần 4'];
                    if (value.toInt() < labels.length) {
                      return Text(labels[value.toInt()], style: TextStyles.bodySmall);
                    }
                    return const Text('');
                  },
                  interval: 1,
                ),
              ),
            ),
            gridData: FlGridData(
              show: true,
              drawHorizontalLine: true,
              horizontalInterval: 1,
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: AppColors.grey.withValues(alpha: 0.3),
                  strokeWidth: 1,
                );
              },
            ),
            borderData: FlBorderData(
              show: false,
            ),
            barGroups: List.generate(
              data.length,
                  (i) => BarChartGroupData(x: i, barRods: [
                BarChartRodData(
                  toY: data[i].toDouble(),
                  color: AppColors.primary,
                  width: 14,
                  borderRadius: BorderRadius.circular(4),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRemainingDayOffList() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.separated(
          itemCount: dayOffBySubject.length,
          separatorBuilder: (_, __) => const Divider(height: 12),
          itemBuilder: (context, index) {
            final subject = dayOffBySubject.keys.elementAt(index);
            final remaining = dayOffBySubject[subject];
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(subject, style: TextStyles.titleMedium),
                  Text(
                    '$remaining ngày',
                    style: TextStyles.titleMedium.copyWith(
                      color: remaining == 0 ? Colors.red : AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}