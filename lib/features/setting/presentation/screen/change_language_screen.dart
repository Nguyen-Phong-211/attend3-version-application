import 'package:flutter/material.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/constants/app_colors_linear_gradient_constants.dart';
import 'package:application/core/constants/border_radius.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:heroicons/heroicons.dart';
import 'package:provider/provider.dart';
import 'package:application/features/setting/presentation/provider/setting_provider.dart';
import 'package:application/l10n/app_localizations.dart';

class LanguageSwitchScreen extends StatefulWidget {
  const LanguageSwitchScreen({super.key});

  @override
  State<LanguageSwitchScreen> createState() => _LanguageSwitchScreenState();
}

class _LanguageSwitchScreenState extends State<LanguageSwitchScreen> {

  final Map<String, String> _languages = {
    'vi': 'Tiếng Việt 🇻🇳',
    'en': 'English 🇬🇧',
  };

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
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
                Text(l10n.languageSwitch, style: TextStyles.titleScaffold),
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

                return Consumer<SettingProvider>(
                  builder: (context, provider, child) {
                    bool isSelected = provider.language == code;

                    return Container(
                      height: 47,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: AppBorderRadius.radius12,
                        border: Border.all(
                          color: isSelected ? AppColors.primary : Colors.grey.shade300,
                          width: 2,
                        ),
                      ),
                      child: InkWell(
                        borderRadius: AppBorderRadius.radius12,
                        onTap: () => provider.changeLanguage(code),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                const SizedBox(width: 16),
                                const HeroIcon(HeroIcons.globeAlt, color: AppColors.primary, size: 15),
                                const SizedBox(width: 12),
                                Text(name, style: TextStyles.titleMedium),
                              ],
                            ),
                            if (isSelected)
                              const Padding(
                                padding: EdgeInsets.only(right: 16),
                                child: Icon(Icons.check_circle, color: AppColors.primary),
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}