import 'package:flutter/material.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/constants/app_colors_linear_gradient_constants.dart';
import 'package:application/core/constants/border_radius.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:application/features/widgets/scaffold_messages.dart';
import 'package:application/core/constants/app_label.dart';
import 'package:heroicons/heroicons.dart';

class LanguageSwitchScreen extends StatefulWidget {
  const LanguageSwitchScreen({super.key});

  @override
  State<LanguageSwitchScreen> createState() => _LanguageSwitchScreenState();
}

class _LanguageSwitchScreenState extends State<LanguageSwitchScreen> {
  String _selectedLanguage = 'vi';

  final Map<String, String> _languages = {
    'vi': 'Tiếng Việt 🇻🇳',
    'en': 'English 🇬🇧',
  };

  void _changeLanguage(String code) {
    setState(() {
      _selectedLanguage = code;
    });
    ScaffoldMessages.informSuccess(context, 'Đã chuyển sang ${_languages[code]}');
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
                const Text(AppLabel.titleScaffoldChangeLanguage, style: TextStyles.titleScaffold),
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

                return Container(
                  height: 47,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: AppBorderRadius.radius12,
                    border: Border.all(
                      color: _selectedLanguage == code ? AppColors.primary : Colors.grey.shade300,
                      width: 2,
                    ),
                  ),
                  child: InkWell(
                    borderRadius: AppBorderRadius.radius12,
                    onTap: () => _changeLanguage(code),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            const SizedBox(width: 16),
                            const HeroIcon(HeroIcons.globeAlt, color: AppColors.primary, size: 15,),
                            const SizedBox(width: 12),
                            Text(name, style: TextStyles.titleMedium),
                          ],
                        ),
                        if (_selectedLanguage == code)
                          const Padding(
                            padding: EdgeInsets.only(right: 16),
                            child: Icon(Icons.check_circle, color: AppColors.primary),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}