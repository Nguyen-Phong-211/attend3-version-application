import 'package:application/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/features/auth/data/auth_repository.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:application/features/auth/injection.dart';
import 'package:application/core/constants/box_shadow_constants.dart';
import 'package:application/core/constants/app_label.dart';
import 'package:application/core/constants/app_images.dart';
import 'package:application/features/widgets/scaffold_messages.dart';
import 'package:application/features/widgets/input_fields.dart';
import 'package:application/core/constants/app_icons.dart';
import 'package:application/core/utils/validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  String? _phoneError;
  String? _passwordError;

  final AuthRepository authRepository = locator<AuthRepository>();

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    setState(() {
      _phoneError = Validators.validatePhoneNumber(_phoneController.text);
      _passwordError = Validators.validatePassword(_passwordController.text);
    });

    if (_phoneError != null || _passwordError != null) return;

    bool success = await authRepository.login(
      _phoneController.text,
      _passwordController.text,
    );

    if (success) {
      ScaffoldMessages.informSuccessLogin(context, AppLabel.informSuccessLogin);
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      ScaffoldMessages.informErrorLogin(context, AppLabel.informErrorLogin);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.backgroundLogin,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Container(
            padding: const EdgeInsets.all(24.0),
            width: double.infinity,
            constraints: BoxConstraints(minHeight: size.height * 0.55),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: AppShadows.cardLoginShadowList,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                // Image logo
                Image.asset(
                  AppImages.imageLogin,
                  height: 50,
                  width: 50,
                ),
                const SizedBox(height: 20),

                // Title Login
                const Text(
                  AppLabel.titleLogin,
                  style: TextStyles.titleHeading,
                ),
                const SizedBox(height: 24),

                /* TextField phone number */
                InputFields.phoneNumber(
                    controller: _phoneController,
                    errorText: _phoneError,
                ),

                const SizedBox(height: 20),

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
                ),
                const SizedBox(height: 8),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ForgotPasswordScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      AppLabel.titleForgotPassword,
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 10),
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: _handleLogin,

                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.backgroundPrimaryButton,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text(
                      AppLabel.titleButtonLogin,
                      style: TextStyles.styleButton,
                    ),
                  ),
                ),
                const SizedBox(height: 40),

                // Button support when login
                TextButton.icon(
                  onPressed: () {},
                  icon: AppIcon.iconSupport,
                  label: const Text(
                    AppLabel.titleContactToSupport,
                    style: TextStyles.styleButtonSupport,
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFF90CAF9),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}