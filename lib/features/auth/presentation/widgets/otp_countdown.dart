import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/constants/app_label.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:application/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:application/features/auth/presentation/bloc/auth_event.dart';
import 'package:application/features/auth/presentation/bloc/auth_state.dart';

class OtpResendTimer extends StatelessWidget {
  const OtpResendTimer({super.key});

  String _formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return "$minutes:$secs";
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          // If countdown is active, show the remaining time
          if (state is OtpCountdown && state.timeLeft > 0) {
            return Text(
              "${AppLabel.titleCountDownTime} ${_formatTime(state.timeLeft)}",
              style: TextStyles.styleButton.copyWith(
                color: AppColors.backgroundPrimaryButton,
              ),
            );
          }
          // If countdown is finished, show "Resend OTP" button
          else {
            return TextButton(
              onPressed: () {
                // Dispatch event to resend OTP
                context.read<AuthBloc>().add(OtpResendRequested());
              },
              child: const Text(
                AppLabel.titleButtonResendOTP,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w900,
                  color: AppColors.backgroundPrimaryButton,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}