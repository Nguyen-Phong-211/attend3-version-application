import 'package:flutter/material.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/theme/text_styles.dart';
import 'otp_verify_screen.dart';
import 'package:application/core/constants/app_colors_linear_gradient_constants.dart';
import 'package:application/core/constants/border_radius.dart';
import 'package:application/core/constants/app_label.dart';
import 'package:application/features/widgets/input_fields.dart';
import 'package:application/core/constants/app_icons.dart';
import 'package:application/core/utils/validator.dart';
import 'package:application/features/widgets/loading_overlay.dart';
import 'package:provider/provider.dart';
import 'package:application/features/auth/presentation/providers/auth_provider.dart';
import 'package:application/core/constants/app_button.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  String? _emailError;

  @override
  void dispose() {
    _emailController.dispose();
    _emailError = null;
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    FocusScope.of(context).unfocus();
    final authProvider = context.read<AuthProvider>();
    authProvider.setLoading(true);

    final email = _emailController.text.trim();
    final error = Validators.validateEmail(email);

    setState(() {
      _emailError = error;
    });

    if (error != null) {
      authProvider.setLoading(false);
      return;
    }

    await Future.delayed(const Duration(seconds: 1));
    authProvider.setLoading(false);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const OtpVerifyScreen(),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    return LoadingOverlay(
        isLoading: authProvider.loading,
        child: Scaffold(
          backgroundColor: AppColors.white,
          body: Column(
            children: [
              // Gradient Header
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(16, 48, 16, 24),
                decoration: const BoxDecoration(
                  gradient: AppLinearGradient.linearGradient,
                  borderRadius: AppBorderRadius.borderRadiusBottomLeftRight24,
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 12),
                    Text(
                        AppLabel.titleForgotPassword,
                        style: TextStyles.titleScaffold
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 48),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    /* TextField email */
                    InputFields.email(
                        controller: _emailController,
                        errorText: _emailError
                    ),
                    const SizedBox(height: 32),

                    AppButton(
                      label: AppLabel.titleButtonSubmit,
                      icon: AppIcon.iconForgotPassword,
                      onPressed: _handleSubmit,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}