import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/constants/app_label.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:application/core/constants/border_radius.dart';

class InputFields {
  const InputFields._(); // private constructor to prevent instantiation

  // Phone number input field
  static Widget phoneNumber({
    required TextEditingController controller,
    String? errorText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppLabel.titleInputPhoneNumber, style: TextStyles.titleInput),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          keyboardType: TextInputType.phone,
          style: TextStyles.titleValueInput,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(10),
          ],
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.phone, color: AppColors.iconInput),
            hintText: AppLabel.hintTextPhoneNumber,
            errorText: errorText,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFBDBDBD), width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  const BorderSide(color: AppColors.inputFocus, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red, width: 2),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red, width: 2),
            ),
          ),
        ),
      ],
    );
  }

  // Password input field
  static Widget password({
    required TextEditingController controller,
    required bool obscureText,
    String? errorText,
    required VoidCallback toggleObscure,
    String? labelText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(AppLabel.titleInputPassword, style: TextStyles.titleInput),
        Text(labelText ?? AppLabel.titleInputPassword, style: TextStyles.titleInput),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          obscureText: obscureText,
          style: TextStyles.titleValueInput,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.lock, color: AppColors.iconInput),
            // hintText: AppLabel.hintTextPassword,
            hintText: labelText ?? AppLabel.hintTextPassword,
            errorText: errorText,
            suffixIcon: IconButton(
              icon: Icon(
                obscureText ? Icons.visibility_off : Icons.visibility,
                color: AppColors.iconInput,
              ),
              onPressed: toggleObscure,
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFBDBDBD), width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  const BorderSide(color: AppColors.inputFocus, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red, width: 2),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red, width: 2),
            ),
          ),
        ),
      ],
    );
  }

  // Email input field
  static Widget email({
    required TextEditingController controller,
    String? errorText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppLabel.titleInputEmailForgotPassword,
            style: TextStyles.titleInput),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: TextInputType.emailAddress,
          style: TextStyles.titleValueInput,
          decoration: InputDecoration(
            hintText: AppLabel.hintTextInputEmail,
            errorText: errorText,
            prefixIcon: const Icon(Icons.email, color: AppColors.primary),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: AppBorderRadius.radius12,
              borderSide: const BorderSide(color: Color(0xFFBDBDBD), width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: AppBorderRadius.radius12,
              borderSide: const BorderSide(
                color: AppColors.inputFocus,
                width: 2.0,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: AppBorderRadius.radius12,
              borderSide: const BorderSide(
                color: Colors.red,
                width: 2.0,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: AppBorderRadius.radius12,
              borderSide: const BorderSide(
                color: Colors.red,
                width: 2.0,
              ),
            ),
          ),
        ),
      ]
    );
  }

  // Input field for OTP
  static Widget otpField({
    required int index,
    required TextEditingController controller,
    required BuildContext context,
  }) {
    return SizedBox(
      width: 50,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: TextStyles.titleValueInputOTP,
        decoration: InputDecoration(
          counterText: '',
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: AppBorderRadius.radius12,
            borderSide: const BorderSide(color: Color(0xFFBDBDBD), width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: AppBorderRadius.radius12,
            borderSide: const BorderSide(color: AppColors.inputFocus, width: 2),
          ),
        ),
        onChanged: (value) {
          if (value.isNotEmpty && index < 5) {
            FocusScope.of(context).nextFocus();
          } else if (value.isEmpty && index > 0) {
            FocusScope.of(context).previousFocus();
          }
        },
      ),
    );
  }
}
