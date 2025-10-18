import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:application/core/constants/app_label.dart';
import 'package:flutter/material.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:application/core/constants/border_radius.dart';
import 'package:application/core/constants/app_colors_linear_gradient_constants.dart';
import 'package:application/core/constants/app_icons.dart';
import 'package:application/features/widgets/input_fields.dart';
import 'package:application/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:application/features/auth/presentation/bloc/auth_event.dart';
import 'package:application/features/auth/presentation/bloc/auth_state.dart';
import 'package:application/features/widgets/scaffold_messages.dart';
import 'package:application/core/utils/validator.dart';
import 'entry_password.dart';
import 'package:application/features/widgets/loading_overlay.dart';
import 'package:application/features/auth/presentation/providers/auth_provider.dart';
import 'package:application/core/constants/app_button.dart';
import 'package:application/features/auth/presentation/widgets/otp_countdown.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({super.key});

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  final List<TextEditingController> _otpControllers =
      List.generate(6, (index) => TextEditingController());

  @override
  void dispose() {
    for (final controller in _otpControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  String _formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return "$minutes:$secs";
  }

  void _handleVerifyOtp() {
    final otp = _otpControllers.map((c) => c.text).join();
    final otpError = Validators.validateOtp(otp);

    if (otpError != null) {
      ScaffoldMessages.informErrorLogin(context, otpError);
      return;
    }

    context.read<AuthBloc>().add(OtpSubmitted(otp));
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AuthBloc>().add(OtpStarted());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is OtpResent) {
            ScaffoldMessages.informResendOTPSuccess(context, state.message);
          } else if (state is OtpVerified) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const ResetPasswordScreen()),
            );
          } else if (state is AuthFailure || state is OtpInvalid) {
            final message = (state is AuthFailure)
                ? state.message
                : (state as OtpInvalid).message;
            ScaffoldMessages.informErrorLogin(context, message);
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
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
                              AppLabel.titleVerifyOTP,
                              style: TextStyles.titleScaffold,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 48),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLabel.titleInputOTP,
                              style: TextStyles.titleInput,
                            ),
                            const SizedBox(height: 20),

                            // OTP Fields
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(
                                6,
                                    (index) => InputFields.otpField(
                                  index: index,
                                  controller: _otpControllers[index],
                                  context: context,
                                ),
                              ),
                            ),

                            const SizedBox(height: 20),

                            // Center(
                            //   child: BlocBuilder<AuthBloc, AuthState>(
                            //     builder: (context, state) {
                            //       if (state is OtpCountdown && state.timeLeft > 0) {
                            //         return Text(
                            //           "${AppLabel.titleCountDownTime} ${_formatTime(state.timeLeft)}",
                            //           style: TextStyles.styleButton.copyWith(
                            //             color: AppColors.backgroundPrimaryButton,
                            //           ),
                            //         );
                            //       } else {
                            //         return TextButton(
                            //           onPressed: () {
                            //             context
                            //                 .read<AuthBloc>()
                            //                 .add(OtpResendRequested());
                            //           },
                            //           child: const Text(
                            //             AppLabel.titleButtonResendOTP,
                            //             style: TextStyle(
                            //               fontSize: 13,
                            //               fontWeight: FontWeight.w900,
                            //               color: AppColors.backgroundPrimaryButton,
                            //             ),
                            //           ),
                            //         );
                            //       }
                            //     },
                            //   ),
                            // ),
                            const OtpResendTimer(),

                            const SizedBox(height: 10),

                            // Confirm button
                            AppButton(
                              label:  AppLabel.titleButtonVerify,
                              icon: AppIcon.iconVerifyOTP,
                              onPressed: _handleVerifyOtp,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
            );
          },
        )
    );
  }
}