import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/constants/app_colors_linear_gradient_constants.dart';
import 'package:application/core/constants/border_radius.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:application/features/setting/presentation/provider/login_history_provider.dart';
import 'package:application/features/setting/presentation/widgets/login_history_card.dart';
import 'package:application/core/constants/app_images.dart';
import 'package:application/core/constants/app_label.dart';
import 'package:application/features/widgets/loading_overlay.dart';

class HistoryLoginScreen extends StatefulWidget {
  const HistoryLoginScreen({super.key});

  @override
  State<HistoryLoginScreen> createState() => _HistoryLoginScreenState();
}

class _HistoryLoginScreenState extends State<HistoryLoginScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        context.read<LoginHistoryProvider>().fetchLoginHistory());
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<LoginHistoryProvider>();

    return LoadingOverlay(
        isLoading: provider.isLoading,
        child: Scaffold(
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
                    const Text(AppLabel.titleScaffoldLoginHistory, style: TextStyles.titleScaffold),
                  ],
                ),
              ),

              Expanded(
                child: Builder(
                  builder: (context) {
                    if (provider.errorMessage != null) {
                      return Center(child: Text('Lỗi: ${provider.errorMessage}'));
                    }
                    if (provider.loginHistory.isEmpty) {
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
                      itemCount: provider.loginHistory.length,
                      itemBuilder: (context, index) {
                        return LoginHistoryCard(item: provider.loginHistory[index]);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        )
    );
  }
}