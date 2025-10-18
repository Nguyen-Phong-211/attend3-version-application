import 'package:flutter/material.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:application/core/constants/app_label.dart';
import 'package:application/features/widgets/input_fields.dart';
import 'package:application/features/widgets/scaffold_messages.dart';
import 'package:application/core/utils/validator.dart';
import 'package:application/core/constants/app_colors_linear_gradient_constants.dart';
import 'package:application/core/constants/border_radius.dart';
import 'package:application/core/constants/app_icons.dart';
import 'package:application/features/widgets/loading_overlay.dart';
import 'package:application/core/constants/app_button.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirm = true;
  bool _isLoading = false;

  String? _passwordError;
  String? _confirmPasswordError;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    setState(() {
      _passwordError = Validators.validatePassword(_passwordController.text);
      _confirmPasswordError = Validators.validateConfirmPassword(
        _passwordController.text,
        _confirmPasswordController.text,
      );
    });

    if (_passwordError != null || _confirmPasswordError != null) return;
    setState(() => _isLoading = true);
    await Future.delayed(Duration(seconds: 2));
    setState(() => _isLoading = false);

    // Action to save new password or call API
    ScaffoldMessages.informSuccessLogin(
        context, AppLabel.titleResetPasswordSuccess
    );
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
        isLoading: _isLoading,
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
                    Text(AppLabel.titleResetPassword,
                        style: TextStyles.titleScaffold),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [

                    /* TextField password */
                    InputFields.password(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      errorText: _passwordError,
                      toggleObscure: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                      labelText: AppLabel.titleNewPassword,
                    ),

                    const SizedBox(height: 20),

                    /* TextField confirm password */
                    InputFields.password(
                      controller: _confirmPasswordController,
                      obscureText: _obscureConfirm,
                      errorText: _confirmPasswordError,
                      toggleObscure: () {
                        setState(() {
                          _obscureConfirm = !_obscureConfirm;
                        });
                      },
                      labelText: AppLabel.titleConfirmPassword,
                    ),

                    const SizedBox(height: 30),

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