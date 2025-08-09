import 'package:flutter/material.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/constants/app_colors_linear_gradient_constants.dart';
import 'package:application/core/constants/border_radius.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LanguageSwitchScreen extends StatefulWidget {
  const LanguageSwitchScreen({super.key});

  @override
  State<LanguageSwitchScreen> createState() => _LanguageSwitchScreenState();
}

class _LanguageSwitchScreenState extends State<LanguageSwitchScreen> {
  String _selectedLanguage = 'vi'; // mặc định là tiếng Việt

  final Map<String, String> _languages = {
    'vi': 'Tiếng Việt 🇻🇳',
    'en': 'English 🇬🇧',
  };

  void _changeLanguage(String code) {
    setState(() {
      _selectedLanguage = code;
    });

    // TODO: Gọi Provider hoặc LocalizationController để thay đổi ngôn ngữ thực sự ở đây

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green),
            SizedBox(width: 8),
            Text('Đã chuyển sang ${_languages[code]}'),
          ],
        ),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          // Header Gradient
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
                Text('Chuyển đổi ngôn ngữ', style: TextStyles.titleScaffold),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // List Language
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: _languages.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                String code = _languages.keys.elementAt(index);
                String name = _languages[code]!;

                return ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(
                      color: _selectedLanguage == code
                          ? AppColors.primary
                          : Colors.grey.shade300,
                      width: 2,
                    ),
                  ),
                  tileColor: Colors.white,
                  leading: const Icon(Icons.language, color: AppColors.primary),
                  title: Text(name, style: TextStyles.titleMedium),
                  trailing: _selectedLanguage == code
                      ? const Icon(Icons.check_circle, color: AppColors.primary)
                      : null,
                  onTap: () => _changeLanguage(code),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}