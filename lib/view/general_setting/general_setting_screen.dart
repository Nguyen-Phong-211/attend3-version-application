import 'package:flutter/material.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:application/core/constants/app_colors_linear_gradient_constants.dart';
import 'package:application/core/constants/border_radius.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:application/core/constants/box_shadow_constants.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDarkMode = false;
  bool pushNotifications = true;
  String selectedLanguage = 'vi';

  final List<Map<String, String>> languages = [
    {'code': 'vi', 'label': 'Tiếng Việt', 'flag': '🇻🇳'},
    {'code': 'en', 'label': 'English', 'flag': '🇬🇧'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                Text('Cài đặt chung', style: TextStyles.titleScaffold),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Settings
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildSectionCard(
                  title: 'Giao diện',
                  children: [
                    _buildSwitchTile(
                      icon: Icons.dark_mode,
                      title: 'Chế độ tối',
                      subtitle: 'Bật giao diện nền tối',
                      value: isDarkMode,
                      onChanged: (value) => setState(() => isDarkMode = value),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                _buildSectionCard(
                  title: 'Thông báo',
                  children: [
                    _buildSwitchTile(
                      icon: Icons.notifications_active_outlined,
                      title: 'Thông báo đẩy',
                      subtitle: 'Nhận thông báo mới',
                      value: pushNotifications,
                      onChanged: (value) => setState(() => pushNotifications = value),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                _buildSectionCard(
                  title: 'Ngôn ngữ',
                  children: [
                    ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      leading: CircleAvatar(
                        backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                        child: const Icon(Icons.language, color: AppColors.primary),
                      ),
                      title: Text('Ngôn ngữ', style: TextStyles.titleMedium,),
                      subtitle: Text(selectedLanguage == 'vi' ? 'Tiếng Việt' : 'English', style: TextStyles.bodyNormal,),
                      trailing: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedLanguage,
                          icon: const Icon(Icons.arrow_drop_down),
                          style: TextStyles.bodyNormal.copyWith(color: AppColors.black),
                          dropdownColor: AppColors.white,
                          onChanged: (value) {
                            if (value != null) {
                              setState(() => selectedLanguage = value);
                            }
                          },
                          items: languages.map((lang) {
                            return DropdownMenuItem<String>(
                              value: lang['code'],
                              child: Row(
                                children: [
                                  Text(lang['flag']!, style: const TextStyle(fontSize: 18)), // Cờ
                                  const SizedBox(width: 8),
                                  Text(
                                    lang['label']!,
                                    style: TextStyles.bodyNormal.copyWith(fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                _buildSectionCard(
                  title: 'Khác',
                  children: [
                    ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      leading: CircleAvatar(
                        backgroundColor: Colors.orange.withValues(alpha: 0.1),
                        child: const Icon(Icons.cleaning_services_outlined, color: Colors.orange),
                      ),
                      title: Text('Xóa bộ nhớ cache', style: TextStyles.titleMedium),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Row(
                              children: const [
                                Icon(Icons.check_circle, color: Colors.green),
                                SizedBox(width: 8),
                                Text('Đã xoá cache'),
                              ],
                            ),
                            behavior: SnackBarBehavior.floating,
                            duration: Duration(seconds: 4),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      leading: CircleAvatar(
                        backgroundColor: Colors.red.withValues(alpha: 0.1),
                        child: const Icon(Icons.logout, color: Colors.red),
                      ),
                      title: Text('Đăng xuất', style: TextStyles.titleMedium),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: Text('Xác nhận'),
                            content: Text('Bạn có chắc chắn muốn đăng xuất?'),
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
    );
  }

  Widget _buildSwitchTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required void Function(bool) onChanged,
  }) {
    return SwitchListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
      secondary: CircleAvatar(
        backgroundColor: AppColors.primary.withValues(alpha: 0.1),
        child: Icon(icon, color: AppColors.primary),
      ),
      title: Text(title, style: TextStyles.titleMedium),
      subtitle: Text(subtitle, style: TextStyles.bodyNormal),
      value: value,
      onChanged: onChanged,
      activeColor: AppColors.primary,
    );
  }

  Widget _buildSectionCard({
    required String title,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyles.titleMedium.copyWith(color: AppColors.black),
        ),
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
}