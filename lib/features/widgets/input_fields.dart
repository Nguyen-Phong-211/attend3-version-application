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
            prefixIcon: const Icon(Icons.phone, color: AppColors.iconInput,),
            hintText: AppLabel.hintTextPhoneNumber,
            errorText: errorText,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFBDBDBD), width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  const BorderSide(color: AppColors.inputFocus, width: 1.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red, width: 1.5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red, width: 1.5),
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
              borderSide: const BorderSide(color: Color(0xFFBDBDBD), width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  const BorderSide(color: AppColors.inputFocus, width: 1.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red, width: 1.5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red, width: 1.5),
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
              borderSide: const BorderSide(color: Color(0xFFBDBDBD), width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: AppBorderRadius.radius12,
              borderSide: const BorderSide(
                color: AppColors.inputFocus,
                  width: 1.5
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: AppBorderRadius.radius12,
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1.5
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: AppBorderRadius.radius12,
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1.5
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
            borderSide: const BorderSide(color: Color(0xFFBDBDBD), width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: AppBorderRadius.radius12,
            borderSide: const BorderSide(color: AppColors.inputFocus, width: 1.5),
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

  static Widget customRadio({
    required String label,
    required String value,
    required String? groupValue,
    required ValueChanged<String> onChanged,
    Color activeColor = Colors.blue,
    TextStyle? labelStyle,
  }) {
    final bool selected = value == groupValue;
    return GestureDetector(
      onTap: () => onChanged(value),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 22,
            height: 22,
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: selected ? activeColor : Colors.grey.shade400,
                width: 2,
              ),
            ),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                color: selected ? activeColor : Colors.transparent,
                shape: BoxShape.circle,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: labelStyle ??
                const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}