import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/features/widgets/bottom_nav_menu.dart';
import 'package:application/routes/app_routes.dart';
import 'package:application/features/setting/presentation/widgets/settings_header.dart';
import 'package:application/features/setting/presentation/widgets/settings_user_info.dart';
import 'package:application/features/setting/presentation/widgets/settings_section_card.dart';
import 'package:application/features/setting/presentation/widgets/settings_tile.dart';
import 'package:application/features/setting/presentation/widgets/settings_switch_tile.dart';
import 'package:application/features/setting/presentation/bloc/settings_bloc.dart';
import 'package:application/features/setting/presentation/bloc/settings_event.dart';
import 'package:application/features/setting/presentation/bloc/settings_state.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:application/features/widgets/scaffold_messages.dart';
import 'package:provider/provider.dart';
import 'package:application/features/setting/presentation/provider/setting_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:application/core/theme/text_styles.dart';
import 'update_profile_screen.dart';
import 'change_password_screen.dart';
import 'change_language_screen.dart';
import 'history_login_screen.dart';
import 'term_screen.dart';
import 'feedback_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sl = GetIt.instance;
    final settingProvider = Provider.of<SettingProvider>(context);

    return BlocProvider(
      create: (_) => SettingBloc(
        getSettingsUseCase: sl(),
        updateSettingsUseCase: sl(),
      )..add(LoadSettingEvent()),
      child: BlocBuilder<SettingBloc, SettingState>(
        builder: (context, state) {
          if (state is SettingInitial) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is SettingLoaded) {
            final bloc = context.read<SettingBloc>();

            return Scaffold(
              backgroundColor: AppColors.white,
              body: Column(
                children: [
                  const SettingsHeader(),
                  const SizedBox(height: 24),
                  SettingsUserInfo(userInfo: state.userInfo),
                  const SizedBox(height: 24),
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      children: [
                        // ---------- TÀI KHOẢN ----------
                        SettingsSectionCard(
                          title: 'Tài khoản',
                          children: [
                            SettingsTile(
                              icon: Icons.edit,
                              title: 'Chỉnh sửa hồ sơ',
                              color: Colors.blue,
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const UpdateProfileScreen(),
                                ),
                              ),
                            ),
                            SettingsTile(
                              icon: Icons.lock_outline,
                              title: 'Đổi mật khẩu',
                              color: Colors.orange,
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const ChangePasswordScreen(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // ---------- ỨNG DỤNG ----------
                        SettingsSectionCard(
                          title: 'Ứng dụng',
                          children: [
                            SettingsTile(
                              icon: Icons.language,
                              title: 'Chuyển đổi ngôn ngữ',
                              color: Colors.green,
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const LanguageSwitchScreen(),
                                ),
                              ),
                            ),
                            SettingsTile(
                              icon: Icons.history,
                              title: 'Lịch sử đăng nhập',
                              color: Colors.teal,
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => HistoryLoginScreen(),
                                ),
                              ),
                            ),
                            SettingsTile(
                              icon: Icons.feedback,
                              title: 'Góp ý / Phản hồi',
                              color: Colors.indigo,
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const FeedbackScreen(),
                                ),
                              ),
                            ),
                            SettingsTile(
                              icon: Icons.warning_amber,
                              title: 'Báo cáo sự cố',
                              color: Colors.red.shade300,
                              onTap: () async {
                                final url = Uri.parse('https://forms.gle/UU6gGGjVkYbBq1Pg7');
                                if (await canLaunchUrl(url)) {
                                  await launchUrl(url, mode: LaunchMode.externalApplication);
                                } else {
                                  ScaffoldMessages.informError(context, 'Không thể mở liên kết báo cáo sự cố');
                                }
                              },
                            ),
                            SettingsTile(
                              icon: Icons.description,
                              title: 'Điều khoản & Chính sách',
                              color: Colors.brown,
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const TermScreen(),
                                ),
                              ),
                            ),
                            SettingsTile(
                              icon: Icons.auto_stories_rounded,
                              title: 'Hướng dẫn sử dụng',
                              color: Colors.purple,
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const TermScreen(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // ---------- HỆ THỐNG ----------
                        SettingsSectionCard(
                          title: 'Hệ thống',
                          children: [
                            SettingsSwitchTile(
                              icon: Icons.dark_mode,
                              title: 'Chế độ tối',
                              subtitle: 'Bật giao diện nền tối',
                              value: settingProvider.isDarkMode,
                              onChanged: (v) => settingProvider.toggleDarkMode(v),
                            ),
                            SettingsSwitchTile(
                              icon: Icons.notifications_active_outlined,
                              title: 'Thông báo đẩy',
                              subtitle: 'Nhận thông báo mới',
                              value: state.pushNotifications,
                              onChanged: (v) =>
                                  bloc.add(TogglePushNotificationEvent(v)),
                            ),
                            SettingsTile(
                              icon: Icons.cleaning_services_outlined,
                              title: 'Xoá bộ nhớ đệm',
                              color: Colors.orange,
                              onTap: () async {
                                final prefs = await SharedPreferences.getInstance();
                                await prefs.clear();
                                await DefaultCacheManager().emptyCache();

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Row(
                                      children: [
                                        Icon(Icons.check_circle, color: Colors.green),
                                        SizedBox(width: 8),
                                        Text(
                                          'Đã xóa bộ nhớ đệm thành công',
                                          style: TextStyle(fontSize: 11),
                                        ),
                                      ],
                                    ),
                                    behavior: SnackBarBehavior.floating,
                                    duration: Duration(seconds: 4),
                                  ),
                                );
                              },
                            ),
                            SettingsTile(
                              icon: Icons.logout,
                              title: 'Đăng xuất',
                              color: Colors.red,
                              onTap: () => _showLogoutDialog(context),
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
                onTap: (index) => _handleNav(context, index),
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  void _handleNav(BuildContext context, int index) {
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
        Navigator.pushNamed(context, AppRoutes.setting);
        break;
    }
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(
          'Xác nhận',
          style: TextStyles.titleHeadingMedium.copyWith(color: Colors.black),
        ),
        content: const Text(
          'Bạn có chắc chắn muốn đăng xuất?',
          style: TextStyles.bodyNormal,
        ),
        actions: [
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.red,
              side: const BorderSide(color: Colors.red),
            ),
            onPressed: () => Navigator.pop(context),
            child: const Text('Hủy'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
            child: const Text('Đăng xuất'),
          ),
        ],
      ),
    );
  }
}