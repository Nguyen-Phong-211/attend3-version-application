import 'package:application/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:application/routes/app_routes.dart';
import 'package:application/features/widgets/bottom_nav_menu.dart';
import 'package:application/features/schedule/presentation/widgets/schedule_header.dart';
import 'package:application/features/schedule/presentation/widgets/schedule_view_switcher.dart';
import 'package:application/features/schedule/presentation/widgets/schedule_date_selector.dart';
import 'package:application/features/schedule/presentation/widgets/schedule_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:application/features/schedule/presentation/bloc/schedule_bloc.dart';
import 'package:application/features/schedule/presentation/bloc/schedule_event.dart';
import 'package:application/features/schedule/presentation/bloc/schedule_state.dart';
import 'package:application/core/constants/app_images.dart';
import 'package:application/core/constants/app_label.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:application/features/widgets/loading_overlay.dart';
import 'package:application/features/schedule/domain/entities/view_mode.dart';

class ScheduleStudyScreen extends StatefulWidget {
  const ScheduleStudyScreen({super.key});

  @override
  State<ScheduleStudyScreen> createState() => _ScheduleStudyScreenState();
}

class _ScheduleStudyScreenState extends State<ScheduleStudyScreen> {
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

  @override
  void initState() {
    super.initState();
    final today = DateTime.now();
    final monday = today.subtract(Duration(days: today.weekday - 1));
    selectedDayIndex = today
        .difference(monday)
        .inDays;

    // Trigger load schedules
    context.read<ScheduleBloc>().add(const FetchScheduleEvent());
  }

  @override
  Widget build(BuildContext context) {
    final selectedDates = _viewMode == ViewMode.week ? weekDates : monthDates;
    final selectedDate = selectedDates[selectedDayIndex];
    final formattedDate =
        '${selectedDate.day.toString().padLeft(2, '0')}/${selectedDate.month
        .toString().padLeft(2, '0')}';

    return BlocBuilder<ScheduleBloc, ScheduleState>(
      builder: (context, state) {
        final isLoading = state is ScheduleLoading;

        return LoadingOverlay(
          isLoading: isLoading,
          child: Scaffold(
            backgroundColor: AppColors.white,
            body: Column(
              children: [
                const ScheduleHeader(title: AppLabel.titleScaffoldSchedule,),
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
                  onDateSelected: (index) =>
                      setState(() => selectedDayIndex = index),
                ),
                const Divider(height: 1),
                Expanded(
                  child: _buildScheduleList(state, formattedDate),
                ),
              ],
            ),
            bottomNavigationBar: CustomBottomNavBar(
              currentIndex: 1,
              onTap: (index) {
                if (index == 0)
                  Navigator.pushNamed(context, AppRoutes.home);
                else if (index == 1)
                  Navigator.pushNamed(context, AppRoutes.schedule);
                else if (index == 3)
                  Navigator.pushNamed(context, AppRoutes.notification);
                else
                if (index == 4) Navigator.pushNamed(context, AppRoutes.setting);
              },
            ),
          ),
        );
      },
    );
  }

  /// The split function processes the calendar list by state.
  Widget _buildScheduleList(ScheduleState state, String formattedDate) {
    if (state is ScheduleLoaded) {
      final daySchedules = state.schedules
          .where((s) =>
      '${s.date.substring(8, 10)}/${s.date.substring(5, 7)}' ==
          formattedDate)
          .toList();

      if (daySchedules.isEmpty) {
        return Center(
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
        );
      }

      return ListView.builder(
        itemCount: daySchedules.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) =>
            ScheduleCard(item: daySchedules[index]),
      );
    } else if (state is ScheduleError) {
      return Center(
        child: Text(
          state.message,
          style: TextStyles.bodyNormal.copyWith(color: Colors.red),
          textAlign: TextAlign.center,
        ),
      );
    } else if (state is ScheduleLoading) {
      return const SizedBox.shrink(); /// Loading has been displayed by overlay
    } else {
      return const SizedBox.shrink();
    }
  }
}