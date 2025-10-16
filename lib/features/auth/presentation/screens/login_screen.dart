import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/constants/app_label.dart';
import 'package:application/core/constants/app_images.dart';
import 'package:application/core/constants/app_boxdecoration.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:application/core/utils/validator.dart';
import 'package:application/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:application/features/auth/presentation/bloc/auth_event.dart';
import 'package:application/features/auth/presentation/bloc/auth_state.dart';
import 'package:application/features/auth/data/auth_repository.dart';
import 'package:application/features/auth/injection.dart';
import 'package:application/features/widgets/input_fields.dart';
import 'package:application/features/widgets/loading_overlay.dart';
import 'package:application/features/widgets/scaffold_messages.dart';
import 'package:application/features/widgets/support_button.dart';
import 'forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  String? _phoneError;
  String? _passwordError;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(const AssetImage(AppImages.imageLogin), context);
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin(BuildContext context) {
    setState(() {
      _phoneError = Validators.validatePhoneNumber(_phoneController.text);
      _passwordError = Validators.validatePassword(_passwordController.text);
    });

    if (_phoneError == null && _passwordError == null) {
      context.read<AuthBloc>().add(
        LoginSubmitted(
          _phoneController.text.trim(),
          _passwordController.text.trim(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (_) => AuthBloc(locator<AuthRepository>()),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            ScaffoldMessages.informSuccessLogin(context, AppLabel.informSuccessLogin);
            Navigator.pushReplacementNamed(context, '/home');
          } else if (state is AuthFailure) {
            ScaffoldMessages.informErrorLogin(context, state.message);
          }
        },
        builder: (context, state) {
          final isLoading = state is AuthLoading;

          return LoadingOverlay(
            isLoading: isLoading,
            child: Scaffold(
              backgroundColor: AppColors.backgroundLogin,
              body: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                  child: Container(
                    padding: const EdgeInsets.all(24.0),
                    width: double.infinity,
                    constraints: BoxConstraints(minHeight: size.height * 0.55),
                    decoration: AppBoxDecoration.boxDecorationPrimary,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 20),

                        Image.asset(AppImages.imageLogin, height: 50, width: 50),
                        const SizedBox(height: 20),

                        const Text(AppLabel.titleLogin, style: TextStyles.titleHeading),
                        const SizedBox(height: 24),

                        InputFields.phoneNumber(
                          controller: _phoneController,
                          errorText: _phoneError,
                        ),
                        const SizedBox(height: 20),

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
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),

                        SizedBox(
                          width: double.infinity,
                          height: 45,
                          child: ElevatedButton(
                            onPressed: isLoading ? null : () => _handleLogin(context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.backgroundPrimaryButton,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                            child: const Text(
                              AppLabel.titleButtonLogin,
                              style: TextStyles.styleButton,
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        const SupportButton(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}