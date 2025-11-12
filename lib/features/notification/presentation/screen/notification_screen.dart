import 'package:flutter/material.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:application/features/widgets/bottom_nav_menu.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:application/core/constants/app_colors_linear_gradient_constants.dart';
import 'package:application/core/constants/border_radius.dart';
import 'package:application/core/constants/box_shadow_constants.dart';
import 'package:application/routes/app_routes.dart';
import 'package:application/core/constants/app_images.dart';
import 'package:application/core/constants/app_label.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<Map<String, dynamic>> notifications = [
    {
      'title': 'Thông báo kiểm tra giữa kỳ',
      'content': 'Bài kiểm tra giữa kỳ môn Kỹ thuật lập trình vào ngày 21/07.',
      'timestamp': DateTime(2025, 7, 18, 9, 0),
      'read': false,
    },
    {
      'title': 'Cập nhật thời khóa biểu',
      'content': 'Lịch học tuần sau đã được cập nhật trên hệ thống.',
      'timestamp': DateTime(2025, 7, 16, 14, 30),
      'read': true,
    },
    {
      'title': 'Thông báo nghỉ học',
      'content': 'Ngày 19/07 lớp Cơ sở dữ liệu nghỉ do giảng viên bận công tác.',
      'timestamp': DateTime(2025, 7, 15, 11, 0),
      'read': false,
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  void markAsRead(int index) {
    setState(() {
      notifications[index]['read'] = true;
    });
  }

  List<Map<String, dynamic>> getTabNotifications(int tabIndex) {
    switch (tabIndex) {
      case 0:
        return notifications; // Tất cả
      case 1:
        return notifications.where((n) => n['read'] == false).toList(); // Chưa đọc
      case 2:
        return notifications.where((n) => n['read'] == true).toList(); // Đã đọc
      default:
        return notifications;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Column(
          children: [
            const NotificationHeader(),
            TabBar(
              controller: _tabController,
              indicatorColor: AppColors.primary,
              labelColor: AppColors.primary,
              unselectedLabelColor: Colors.grey,
              tabs: const [
                Tab(text: 'Tất cả'),
                Tab(text: 'Chưa đọc'),
                Tab(text: 'Đã đọc'),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: List.generate(3, (index) {
                  final tabNotifications = getTabNotifications(index);
                  if (tabNotifications.isEmpty) {
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
                    padding: const EdgeInsets.all(16),
                    itemCount: tabNotifications.length,
                    itemBuilder: (context, i) {
                      final item = tabNotifications[i];
                      return NotificationCardWidget(
                        item: item,
                        isUnread: !item['read'],
                        onMarkRead: () =>
                            markAsRead(notifications.indexOf(item)),
                      );
                    },
                  );
                }),
              ),
            ),
          ],
        ),
        bottomNavigationBar: CustomBottomNavBar(
          currentIndex: 3,
          onTap: (index) {
            if (index == 0) {
              Navigator.pushNamed(context, AppRoutes.home);
            } else if (index == 1) {
              Navigator.pushNamed(context, AppRoutes.schedule);
            } else if (index == 3) {
              Navigator.pushNamed(context, AppRoutes.notification);
            } else if (index == 4) {
              Navigator.pushNamed(context, AppRoutes.setting);
            }
          },
        ),
      ),
    );
  }
}

class NotificationHeader extends StatelessWidget {
  const NotificationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 24),
      decoration: const BoxDecoration(
        gradient: AppLinearGradient.linearGradient,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const FaIcon(FontAwesomeIcons.chevronLeft,
                color: AppColors.white),
          ),
          const SizedBox(width: 12),
          const Text('Thông báo', style: TextStyles.titleScaffold),
        ],
      ),
    );
  }
}

class NotificationCardWidget extends StatelessWidget {
  final Map<String, dynamic> item;
  final bool isUnread;
  final VoidCallback? onMarkRead;

  const NotificationCardWidget({
    Key? key,
    required this.item,
    this.isUnread = false,
    this.onMarkRead,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final timeStr = DateFormat('dd/MM/yyyy HH:mm').format(item['timestamp']);

    final borderColor = isUnread ? Colors.orange : Colors.green;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppBorderRadius.radius12,
        border: Border(
          left: BorderSide(
            color: borderColor,
            width: 6,
          ),
        ),
        boxShadow: AppShadows.cardShadowGeneralList,
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        title: Text(
          item['title'],
          style: TextStyles.titleCard.copyWith(
            color: Colors.black,
            fontWeight: isUnread ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 6),
            Text(
              item['content'],
              style: TextStyles.bodyNormal.copyWith(
                color: Colors.grey.shade800,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              timeStr,
              style: const TextStyle(fontSize: 10, color: Colors.black54),
            ),

            if (isUnread && onMarkRead != null)
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: onMarkRead,
                  child: Text('Đánh dấu đã đọc', style: TextStyles.titleSmall.copyWith(color: AppColors.primary)),
                ),
              ),
          ],
        ),
      ),
    );
  }
}