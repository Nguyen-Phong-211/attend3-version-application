import 'package:application/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:application/routes/app_routes.dart';
import 'package:application/view/widgets/bottom_nav_menu.dart';
import 'package:application/view/schedule/widgets/schedule_header.dart';
import 'package:application/view/schedule/widgets/schedule_view_switcher.dart';
import 'package:application/view/schedule/widgets/schedule_date_selector.dart';
import 'package:application/view/schedule/widgets/schedule_card.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

enum ViewMode { week, month }

class _ScheduleScreenState extends State<ScheduleScreen> {
  ViewMode _viewMode = ViewMode.week;
  late int selectedDayIndex;

  final List<DateTime> weekDates = List.generate(7, (index) {
    final now = DateTime.now();
    final monday = now.subtract(Duration(days: now.weekday - 1));
    return monday.add(Duration(days: index));
  });

  final List<DateTime> monthDates = List.generate(31, (index) {
    final now = DateTime.now();
    final firstDay = DateTime(now.year, now.month, 1);
    return firstDay.add(Duration(days: index));
  });

  final Map<String, List<Map<String, String>>> scheduleData = {
    '30/07': [
      {'time': '09:00 - 17:30', 'title': 'Toán cao cấp 1', 'host': 'Lê Văn Phong', 'location': 'A01'},
    ],
    '27/07': [
      {'time': '09:00 - 11:30', 'title': 'Toán cao cấp 2', 'host': 'Nguyễn Văn Minh', 'location': 'A03'},
    ],
  };

  @override
  void initState() {
    super.initState();
    final today = DateTime.now();
    final monday = today.subtract(Duration(days: today.weekday - 1));
    selectedDayIndex = today.difference(monday).inDays;
  }

  @override
  Widget build(BuildContext context) {
    final selectedDates = _viewMode == ViewMode.week ? weekDates : monthDates;
    final selectedDate = selectedDates[selectedDayIndex];
    final formattedDate = '${selectedDate.day.toString().padLeft(2, '0')}/${selectedDate.month.toString().padLeft(2, '0')}';
    final daySchedules = scheduleData[formattedDate] ?? [];

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          const ScheduleHeader(),
          ScheduleViewSwitcher(
            viewMode: _viewMode,
            onChanged: (mode) {
              setState(() {
                _viewMode = mode;
                selectedDayIndex = 0;
              });
            },
          ),
          ScheduleDateSelector(
            dates: selectedDates,
            selectedIndex: selectedDayIndex,
            onDateSelected: (index) => setState(() => selectedDayIndex = index),
          ),
          const Divider(height: 1),
          Expanded(
            child: daySchedules.isEmpty
                ? const Center(child: Text('Không có lịch học nào cho ngày này'))
                : ListView.builder(
              itemCount: daySchedules.length,
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) => ScheduleCard(item: daySchedules[index]),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) Navigator.pushNamed(context, AppRoutes.home);
          else if (index == 1) Navigator.pushNamed(context, AppRoutes.schedule);
          else if (index == 3) Navigator.pushNamed(context, AppRoutes.notification);
          else if (index == 4) Navigator.pushNamed(context, AppRoutes.profile);
        },
      ),
    );
  }
}