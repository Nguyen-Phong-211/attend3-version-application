import 'package:flutter/material.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/constants/app_colors_linear_gradient_constants.dart';
import 'package:application/core/constants/box_shadow_constants.dart';
import 'package:application/core/constants/border_radius.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:application/view/profile/update_profile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'change_password_screen.dart';
import 'change_language_screen.dart';
import 'history_login_screen.dart';
import 'package:application/view/incident_report/incident_report_screen.dart';
import 'package:application/view/widgets/bottom_nav_menu.dart';
import 'package:application/routes/app_routes.dart';
import 'package:application/view/term/term_screen.dart';
import 'package:application/view/feedback/feedback_screen.dart';

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
          // Header
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
                  child: const FaIcon(FontAwesomeIcons.chevronLeft, color: AppColors.white),
                ),
                const SizedBox(width: 12),
                Text('Hồ sơ của tôi', style: TextStyles.titleScaffold),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Avatar + Name + Email
          CircleAvatar(
            radius: 40,
            backgroundColor: AppColors.primary.withValues(alpha: 0.1),
            child: const Icon(Icons.person, size: 40, color: AppColors.primary),
          ),
          const SizedBox(height: 12),
          Text(userInfo['name']!, style: TextStyles.titleMedium),
          const SizedBox(height: 4),
          Text(userInfo['email']!, style: TextStyles.bodyNormal),

          const SizedBox(height: 24),

          // Action Tiles
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildSectionCard(
                  title: 'Tài khoản',
                  children: [
                    _buildTile(
                      icon: Icons.edit,
                      title: 'Chỉnh sửa hồ sơ',
                      color: Colors.blue,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const UpdateProfileScreen()),
                      ),
                    ),
                    _buildTile(
                      icon: Icons.lock_outline,
                      title: 'Đổi mật khẩu',
                      color: Colors.orange,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ChangePasswordScreen()
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                _buildSectionCard(
                  title: 'Ứng dụng',
                  children: [
                    _buildTile(
                      icon: Icons.language,
                      title: 'Chuyển đổi ngôn ngữ',
                      color: Colors.green,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LanguageSwitchScreen()
                          ),
                        );
                      },
                    ),
                    _buildTile(
                      icon: Icons.history,
                      title: 'Lịch sử đăng nhập',
                      color: Colors.teal,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HistoryLoginScreen()
                          ),
                        );
                      },
                    ),
                    _buildTile(
                      icon: Icons.folder_shared,
                      title: 'Tài liệu của tôi',
                      color: Colors.purple,
                      onTap: () {},
                    ),
                    _buildTile(
                      icon: Icons.devices,
                      title: 'Thiết bị đã đăng nhập',
                      color: Colors.deepOrange,
                      onTap: () {
                        // TODO: Điều hướng đến trang quản lý thiết bị
                      },
                    ),
                    _buildTile(
                      icon: Icons.feedback,
                      title: 'Góp ý / Phản hồi',
                      color: Colors.indigo,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FeedbackScreen()
                          ),
                        );
                      },
                    ),
                    _buildTile(
                      icon: Icons.warning_amber,
                      title: 'Báo cáo sự cố',
                      color: Colors.red.shade300,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const IncidentReportScreen()
                          ),
                        );
                      },
                    ),
                    _buildTile(
                      icon: Icons.description,
                      title: 'Điều khoản & Chính sách',
                      color: Colors.brown,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TermScreen()
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                _buildSectionCard(
                  title: 'Hệ thống',
                  children: [
                    _buildTile(
                      icon: Icons.logout,
                      title: 'Đăng xuất',
                      color: Colors.red,
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: const Text('Xác nhận'),
                            content: const Text('Bạn có chắc chắn muốn đăng xuất?'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Hủy'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacementNamed(context, '/login');
                                },
                                child: const Text('Đăng xuất'),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 4,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, AppRoutes.home);
          } else if (index == 1) {
            Navigator.pushNamed(context, AppRoutes.schedule);
          } else if (index == 3) {
            Navigator.pushNamed(context, AppRoutes.notification);
          } else if (index == 4) {
            Navigator.pushNamed(context, AppRoutes.profile);
          }
        },
      ),
    );
  }

  Widget _buildSectionCard({
    required String title,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyles.titleMedium.copyWith(color: AppColors.black)),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: AppShadows.cardShadowList,
          ),
          child: Column(children: children),
        ),
      ],
    );
  }

  Widget _buildTile({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      leading: CircleAvatar(
        backgroundColor: color.withValues(alpha: 0.1),
        child: Icon(icon, color: color),
      ),
      title: Text(title, style: TextStyles.titleMedium),
      onTap: onTap,
    );
  }
}