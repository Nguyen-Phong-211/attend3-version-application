import 'package:flutter/material.dart';
import 'package:application/routes/app_routes.dart';
import 'package:application/view/widgets/bottom_nav_menu.dart';
import 'package:application/view/notification/widgets/notification_header.dart';
import 'package:application/view/notification/widgets/notification_card.dart';
import 'package:application/core/constants/app_colors.dart';

enum SortOption { newest, oldest }

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  SortOption _selectedSort = SortOption.newest;

  final List<Map<String, dynamic>> notifications = [
    {
      'title': 'Thông báo kiểm tra giữa kỳ',
      'content': 'Bài kiểm tra giữa kỳ môn Kỹ thuật lập trình vào ngày 21/07.',
      'timestamp': DateTime(2025, 7, 18, 9, 0),
    },
    {
      'title': 'Cập nhật thời khóa biểu',
      'content': 'Lịch học tuần sau đã được cập nhật trên hệ thống.',
      'timestamp': DateTime(2025, 7, 16, 14, 30),
    },
    {
      'title': 'Thông báo nghỉ học',
      'content': 'Ngày 19/07 lớp Cơ sở dữ liệu nghỉ do giảng viên bận công tác.',
      'timestamp': DateTime(2025, 7, 15, 11, 0),
    },
  ];

  @override
  Widget build(BuildContext context) {
    final sorted = [...notifications];
    sorted.sort((a, b) => _selectedSort == SortOption.newest
        ? b['timestamp'].compareTo(a['timestamp'])
        : a['timestamp'].compareTo(b['timestamp']));

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          NotificationHeader(
            selectedSort: _selectedSort,
            onSortChanged: (option) => setState(() => _selectedSort = option),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: sorted.length,
              itemBuilder: (context, index) =>
                  NotificationCard(item: sorted[index]),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 3,
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
}