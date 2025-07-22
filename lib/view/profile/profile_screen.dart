import 'package:flutter/material.dart';
import 'package:application/routes/app_routes.dart';
import 'package:application/view/widgets/bottom_nav_menu.dart';
import 'package:application/core/constants/app_colors.dart';
import 'widgets/profile_header.dart';
import 'widgets/profile_avatar.dart';
import 'widgets/profile_action_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  final Map<String, String> userInfo = const {
    'name': 'Lê Văn Phong',
    'email': 'phong.le@example.com',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          const ProfileHeader(),
          const SizedBox(height: 24),
          ProfileAvatar(
            name: userInfo['name']!,
            email: userInfo['email']!,
          ),

          const SizedBox(height: 24),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ListView(
                children: [
                  ProfileActionTile(icon: Icons.edit, title: 'Chỉnh sửa hồ sơ', onTap: () {}),
                  ProfileActionTile(icon: Icons.lock_outline, title: 'Đổi mật khẩu', onTap: () {}),
                  ProfileActionTile(icon: Icons.language, title: 'Chuyển đổi ngôn ngữ', onTap: () {}),
                  ProfileActionTile(icon: Icons.history, title: 'Lịch sử đăng nhập', onTap: () {}),
                  ProfileActionTile(icon: Icons.folder_shared, title: 'Tài liệu của tôi', onTap: () {}),
                  ProfileActionTile(icon: Icons.logout, title: 'Đăng xuất', onTap: () {}),
                ],
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 4,
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